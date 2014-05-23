//
//  MyClass2.m
//  KVO
//
//  Created by panda zheng on 14-5-22.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "MyClass2.h"

@implementation MyClass2

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"I heard about the change!");
}

@end
