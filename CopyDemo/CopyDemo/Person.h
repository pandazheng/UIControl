//
//  Person.h
//  CopyDemo
//
//  Created by panda zheng on 14-5-23.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCopying>

@property (nonatomic,copy) NSMutableString *name;
@property (nonatomic,retain) NSNumber *age;

@end
