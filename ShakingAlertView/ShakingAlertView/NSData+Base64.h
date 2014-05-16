//
//  NSData + Base64.h
//  ShakingAlertView
//
//  Created by panda zheng on 14-5-15.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/NSData.h>

@class NSString;

@interface NSData (Base64)

+ (NSData *) dataFromBase64String: (NSString *) base64String;
- (id) initWithBase64String: (NSString *) base64String;
- (NSString *) base64EncodedString;

@end
