//
//  ShakingAlertView.m
//  ShakingAlertView
//
//  Created by panda zheng on 14-5-15.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "ShakingAlertView.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSData+Base64.h"

typedef enum {
    ShakingAlertViewButtonIndexDismiss = 0,
    ShakingAlertViewButtonIndexSuccess = 10
} ShakingAlertViewButtonIndex;

@implementation ShakingAlertView

#pragma mark - Constructors

- (id) initWithAlertTitle:(NSString *)title checkForPassword:(NSString *)password
{
    self = [super initWithTitle:title message:@"----blank----" delegate:self
              cancelButtonTitle:@"Cancel" otherButtonTitles:@"Enter", nil];
    if (self)
    {
        self.password = password;
        self.hashTechnique = HashTechniqueNone;
    }
    
    return self;
}

- (id) initWithAlertTitle:(NSString *)title checkForPassword:(NSString *)password onCorrectPassword:(void (^)())correctPasswordBlock onDismissalWithoutPassword:(void (^)())dismissalWithoutPasswordBlock
{
    self = [self initWithAlertTitle:title checkForPassword:password];
    if (self)
    {
        self.onCorrectPassword = correctPasswordBlock;
        self.onDismissalWithoutPassword = dismissalWithoutPasswordBlock;
    }
    
    return self;
}

- (id) initWithAlertTitle:(NSString *)title checkForPassword:(NSString *)password usingHashingTechnique:(HashTechnique)hashingTechnique
{
    self = [self initWithAlertTitle:title checkForPassword:password];
    if (self)
    {
        self.hashTechnique = hashingTechnique;
    }
    
    return self;
}

- (id) initWithAlertTitle:(NSString *)title checkForPassword:(NSString *)password usingHashingTechnique:(HashTechnique)hashingTechnique onCorrectPassword:(void (^)())correctPasswordBlock onDismissalWithoutPassword:(void (^)())dismissalWithoutPasswordBlock
{
    self = [self initWithAlertTitle:title checkForPassword:password usingHashingTechnique:hashingTechnique];
    if (self)
    {
        self.onCorrectPassword = correctPasswordBlock;
        self.onDismissalWithoutPassword = dismissalWithoutPasswordBlock;
    }
    
    return self;
}

- (void)show {
    
    // Textfield for the password
    // Position it over the message section of the alert
    UITextField *passwordField = [[UITextField alloc] initWithFrame:CGRectMake(14, 45, 256, 25)];
    passwordField.secureTextEntry = YES;
    passwordField.placeholder = @"password";
    passwordField.backgroundColor = [UIColor whiteColor];
    
    // Pad out the left side of the view to properly inset the text
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 6, 19)];
    passwordField.leftView = paddingView;
    passwordField.leftViewMode = UITextFieldViewModeAlways;
    
    // Set delegate
    passwordField.delegate = self;
    
    // Set as property
    self.passwordField = passwordField;

    
    // Add to subview
    [self addSubview:self.passwordField];
    
    // Show alert
    [super show];
    
    // present keyboard for text entry
    [self.passwordField performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.1];
    
}

- (void)animateIncorrectPassword {
    // Clear the password field
    self.passwordField.text = nil;
    
    // Animate the alert to show that the entered string was wrong
    // "Shakes" similar to OS X login screen
    CGAffineTransform moveRight = CGAffineTransformTranslate(CGAffineTransformIdentity, 20, 0);
    CGAffineTransform moveLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -20, 0);
    CGAffineTransform resetTransform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 0);
    
    [UIView animateWithDuration:0.1 animations:^{
        // Translate left
        self.transform = moveLeft;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1 animations:^{
            
            // Translate right
            self.transform = moveRight;
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.1 animations:^{
                
                // Translate left
                self.transform = moveLeft;
                
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:0.1 animations:^{
                    
                    // Translate to origin
                    self.transform = resetTransform;
                }];
            }];
            
        }];
    }];
    
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // If "Enter" button pressed on alert view then check password
    if (buttonIndex == alertView.firstOtherButtonIndex) {
        
        if ([self enteredTextIsCorrect]) {
            
            // Hide keyboard
            [self.passwordField resignFirstResponder];
            
            // Dismiss with success
            [alertView dismissWithClickedButtonIndex:ShakingAlertViewButtonIndexSuccess animated:YES];
            _onCorrectPassword();
            
        }
        
        // If incorrect then animate
        else {
            [self animateIncorrectPassword];
        }
    }
}


// Overide to customise when alert is dimsissed
- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated {
    
    // Only dismiss for ShakingAlertViewButtonIndexDismiss or ShakingAlertViewButtonIndexSuccess
    // This means we don't dissmis for the case where "Enter" button is pressed and password is incorrect
    switch (buttonIndex) {
        case ShakingAlertViewButtonIndexSuccess:
            [super dismissWithClickedButtonIndex:ShakingAlertViewButtonIndexDismiss animated:animated];
            _onCorrectPassword();
            break;
        case ShakingAlertViewButtonIndexDismiss:
            [super dismissWithClickedButtonIndex:ShakingAlertViewButtonIndexDismiss animated:animated];
            _onDismissalWithoutPassword();
            break;
        default:
            break;
    }
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Check password
    if ([self enteredTextIsCorrect]) {
        
        // Hide keyboard
        [self.passwordField resignFirstResponder];
        
        // Dismiss with success
        [self dismissWithClickedButtonIndex:ShakingAlertViewButtonIndexSuccess animated:YES];
        
        return YES;
    }
    
    // Password is incorrect to so animate
    [self animateIncorrectPassword];
    return NO;
}

- (BOOL)enteredTextIsCorrect {
    switch (_hashTechnique) {
            
            // No hashing algorithm used
        case HashTechniqueNone:
            return [_passwordField.text isEqualToString:_password];
            break;
            
            
            // SHA1 used
        case HashTechniqueSHA1: {
            
            unsigned char digest[CC_SHA1_DIGEST_LENGTH];
            NSData *stringBytes = [_passwordField.text dataUsingEncoding: NSUTF8StringEncoding];
            CC_SHA1([stringBytes bytes], [stringBytes length], digest);
            
            NSData *pwHashData = [[NSData alloc] initWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
            NSString *hashedEnteredPassword = [pwHashData base64EncodedString];
            
            return [hashedEnteredPassword isEqualToString:_password];
            
        }
            break;
            
            
            // MD5 used
        case HashTechniqueMD5: {
            
            unsigned char digest[CC_MD5_DIGEST_LENGTH];
            NSData *stringBytes = [_passwordField.text dataUsingEncoding: NSUTF8StringEncoding];
            CC_MD5([stringBytes bytes], [stringBytes length], digest);
            
            NSData *pwHashData = [[NSData alloc] initWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
            NSString *hashedEnteredPassword = [pwHashData base64EncodedString];
            
            return [hashedEnteredPassword isEqualToString:_password];
            
        }
            break;
            
        default:
            break;
    }
    
    
    // To stop Xcode complaining return NO by default
    return NO;
    
}

@end
