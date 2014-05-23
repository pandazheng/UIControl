//
//  main.m
//  CustomArchivie
//
//  Created by panda zheng on 14-5-23.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        User *user = [[User alloc] init];
        user.name = @"jack";
        user.age = 22;
        user.email = @"jack@qq.com";
        user.password = @"123456";
        
        NSString *path = NSHomeDirectory();
        NSString *dir = [path stringByAppendingPathComponent:@"user.archiver"];
        BOOL success = [NSKeyedArchiver archiveRootObject:user toFile:dir];
        if (success)
        {
            NSLog(@"archive success");
        }
        
        NSString *path2 = NSHomeDirectory();
        NSString *dir2 = [path2 stringByAppendingPathComponent:@"user.archiver"];
        User *user2 = [NSKeyedUnarchiver unarchiveObjectWithFile:dir2];
        NSLog(@"%@",user2);
    }
    return 0;
}

