//
//  main.m
//  KVO
//
//  Created by panda zheng on 14-5-22.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass1.h"
#import "MyClass2.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        MyClass1 *objectA = [[MyClass1 alloc] init];
        MyClass2 *objectB = [[MyClass2 alloc] init];
        
        //KVO注册
        [objectA addObserver:objectB forKeyPath:@"value" options:0 context:nil];
        objectA.value = @"Hello World";  //结果: objectB's observeValueForKeyPath:被调用
    }
    return 0;
}

