//
//  User.m
//  CustomArchivie
//
//  Created by panda zheng on 14-5-23.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "User.h"

#define AGE @"age"
#define NAME @"name"
#define EMAIL @"email"
#define PASSWORD @"password"

@implementation User

//对属性编码，归档的时候会调用
- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:_age forKey:AGE];
    [aCoder encodeObject:_name forKey:NAME];
    [aCoder encodeObject:_email forKey:EMAIL];
    [aCoder encodeObject:_password forKey:PASSWORD];
}

//对属性解码，解归档调用
- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self != nil)
    {
        _age = [aDecoder decodeIntForKey:AGE];
        self.name = [aDecoder decodeObjectForKey:NAME];
        self.email = [aDecoder decodeObjectForKey:EMAIL];
        self.password = [aDecoder decodeObjectForKey:PASSWORD];
    }
    
    return self;
}

- (NSString *) description
{
    NSString *str = [NSString stringWithFormat:@"age = %d ,name = %@, email = %@,password = %@",_age,_name,_email,_password];
    return str;
}

@end
