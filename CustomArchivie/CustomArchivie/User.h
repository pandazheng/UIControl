//
//  User.h
//  CustomArchivie
//
//  Created by panda zheng on 14-5-23.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *email;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,assign) int age;

@end
