//
//  NSData + Base64.m
//  ShakingAlertView
//
//  Created by panda zheng on 14-5-15.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+Base64.h"
#import "Base64.h"

@implementation NSData (Base64)

+ (NSData *) dataFromBase64String: (NSString *) base64String
{
    NSData * charData = [base64String dataUsingEncoding: NSUTF8StringEncoding];
    return ( b64_decode(charData) );
}

- (id) initWithBase64String: (NSString *) base64String
{
    NSData * charData = [base64String dataUsingEncoding: NSUTF8StringEncoding];
    NSData * result = b64_decode(charData);
    return ( result );
}

- (NSString *) base64EncodedString
{
    NSData * charData = b64_encode( self );
    return ( [[NSString alloc] initWithData: charData encoding: NSUTF8StringEncoding] );
}

@end
