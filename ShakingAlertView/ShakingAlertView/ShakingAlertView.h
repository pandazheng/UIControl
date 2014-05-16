//
//  ShakingAlertView.h
//  ShakingAlertView
//
//  Created by panda zheng on 14-5-15.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    HashTechniqueNone,
    HashTechniqueSHA1,
    HashTechniqueMD5
} HashTechnique;

@interface ShakingAlertView : UIAlertView <UITextFieldDelegate>

@property (nonatomic,strong) UITextField *passwordField;

@property (nonatomic, strong) NSString *password;

@property (nonatomic, copy) void(^onCorrectPassword)();
@property (nonatomic, copy) void(^onDismissalWithoutPassword)();

@property (assign) HashTechnique hashTechnique;


// Constructors for plaintext password
- (id)initWithAlertTitle:(NSString *)title
        checkForPassword:(NSString *)password;

- (id)initWithAlertTitle:(NSString *)title
        checkForPassword:(NSString *)password
       onCorrectPassword:(void(^)())correctPasswordBlock
onDismissalWithoutPassword:(void(^)())dismissalWithoutPasswordBlock;


// Constructors for hashed passwords
- (id)initWithAlertTitle:(NSString *)title
        checkForPassword:(NSString *)password
   usingHashingTechnique:(HashTechnique)hashingTechnique;

- (id)initWithAlertTitle:(NSString *)title
        checkForPassword:(NSString *)password
   usingHashingTechnique:(HashTechnique)hashingTechnique
       onCorrectPassword:(void(^)())correctPasswordBlock
onDismissalWithoutPassword:(void(^)())dismissalWithoutPasswordBlock;

@end
