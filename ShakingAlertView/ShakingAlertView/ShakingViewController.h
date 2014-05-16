//
//  ShakingViewController.h
//  ShakingAlertView
//
//  Created by panda zheng on 14-5-15.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShakingAlertView.h"

@interface ShakingViewController : UIViewController <UIAlertViewDelegate>

- (IBAction) plainTextLoginTapped: (id) sender;
- (IBAction) sha1LoginTapped: (id) sender;
- (IBAction) md5LoginTaped :(id)sender;

//- (IBAction) JumpView : (id) sender;

@end
