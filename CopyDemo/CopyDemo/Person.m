//
//  Person.m
//  CopyDemo
//
//  Created by panda zheng on 14-5-23.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id) copyWithZone:(NSZone *)zone
{
    /*区别：浅拷贝：只复制对象，对象里的属性，包含的对象不做拷贝，深拷贝：即复制对象本身，对象里包含对象，属性也复制*/
    /*浅拷贝*/
    Person *person = [[[self class] allocWithZone:zone] init];
    person.name = _name;
    person.age = _age;
//    return person;
    
    /*深拷贝*/
//    Person *person = [[[self class] allocWithZone:zone] init];
//    NSMutableString *name = [_name mutableCopy];
//    NSNumber *age = [_age copy];
//    person.name = name;
//    person.age = age;
    return person;
}

@end
