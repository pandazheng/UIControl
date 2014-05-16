//
//  ShakingViewController.m
//  ShakingAlertView
//
//  Created by panda zheng on 14-5-15.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "ShakingViewController.h"
#import "ModalViewController.h"

@interface ShakingViewController ()

@end

@implementation ShakingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) plainTextLoginTapped: (id) sender
{
    ShakingAlertView *shakingAlert = [[ShakingAlertView alloc] initWithAlertTitle:@"Enter Pasword" checkForPassword:@"password"];
    
    [shakingAlert setOnCorrectPassword:^{
        [self showModalView];
    }];
    
    [shakingAlert setOnDismissalWithoutPassword:^{
        [self showFailedPasswordAlert];
    }];
    
    [shakingAlert show];
}

- (IBAction) sha1LoginTapped: (id) sender
{
    ShakingAlertView *shakingAlert = [[ShakingAlertView alloc]
                                      initWithAlertTitle:@"Enter Password"
                                      checkForPassword:@"W6ph5Mm5Pz8GgiULbPgzG37mj9g=" //SHA1 hash of 'password'
                                      usingHashingTechnique:HashTechniqueSHA1];
    
    [shakingAlert setOnCorrectPassword:^{
        [self showModalView];
        
    }];
    
    [shakingAlert setOnDismissalWithoutPassword:^{
        [self showFailedPasswordAlert];
        
    }];
    
    
    [shakingAlert show];
}

- (IBAction) md5LoginTaped :(id)sender
{
    ShakingAlertView *shakingAlert = [[ShakingAlertView alloc]
                                      initWithAlertTitle:@"Enter Password"
                                      checkForPassword:@"X03MO1qnZdYdgyfeuILPmQ==" //MD5 hash of 'password'
                                      usingHashingTechnique:HashTechniqueMD5
                                      onCorrectPassword:^{
                                          [self showModalView];
                                      }
                                      onDismissalWithoutPassword:^{
                                          [self showFailedPasswordAlert];
                                          
                                      }];
    [shakingAlert show];
}

/*
- (IBAction) JumpView : (id) sender
{
    [self showModalView];
}*/

#pragma mark -- Others
- (void) showModalView
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ModalViewController *mvc = [storyboard instantiateViewControllerWithIdentifier:@"ModalView"];
    [self presentViewController:mvc animated:YES completion:^(void){
        
    }];
}

- (void) showFailedPasswordAlert
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Failed Password Entry"
                          message:@"To access the password protected view you must enter a valid password. Try again?"
                          delegate:self
                          cancelButtonTitle:@"No"
                          otherButtonTitles:@"Yes", nil];
    [alert show];
}

#pragma mark -- UIAlertViewDelegate
- (void) alertView:(UIAlertView *) alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != alertView.cancelButtonIndex)
    {
        [self plainTextLoginTapped:nil];
    }
}

@end
