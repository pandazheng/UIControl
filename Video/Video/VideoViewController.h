//
//  VideoViewController.h
//  Video
//
//  Created by panda zheng on 14-5-22.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController : UIViewController
{
    MPMoviePlayerController *mpcontroller;
}

@property (nonatomic,strong) MPMoviePlayerController *mpcontroller;

@end
