//
//  main.m
//  CopyDemo
//
//  Created by panda zheng on 14-5-23.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Person *person1 = [[Person alloc] init];
        person1.name = [NSMutableString stringWithString:@"jack"];
        person1.age = @20;
        
        Person *person2 = [person1 copy];
        
        NSLog(@"person1的地址: %p,person2的地址: %p",person1,person2);
        NSLog(@"age1的地址: %p,age2的地址: %p",person1.name,person2.name);
        
//        NSArray *array1 = [[NSArray alloc] initWithObjects:@"ttt", nil];
//        NSArray *array2 = [array1 copy];
//        NSLog(@"array1指针: %p , array2指针: %p",array1,array2);
//        
//        NSMutableString *s = [NSMutableString stringWithString:@"xxxx"];
//        NSString *s2 = [s copy];
//        NSLog(@"s的地址： %p,s2的地址： %p",s,s2);
        

    }
    return 0;
}

