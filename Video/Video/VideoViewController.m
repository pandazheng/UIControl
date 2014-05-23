//
//  VideoViewController.m
//  Video
//
//  Created by panda zheng on 14-5-22.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController
@synthesize mpcontroller;

- (void)viewDidLoad
{
	// Do any additional setup after loading the view, typically from a nib.
    NSString *loc = [[NSBundle mainBundle] pathForResource:@"sample_iTunes" ofType:@"mov"];
    NSURL *url = [NSURL fileURLWithPath:loc];
    //初始化播放器
    mpcontroller = [[MPMoviePlayerController alloc] initWithContentURL:url];
    //把播放器的视图添加到当前视图下（作为子视图）
    [self.view addSubview:mpcontroller.view];
    
    //设置frame，让它显示在屏幕上，分别是X,Y，宽度和高度，你可以再调整
    mpcontroller.view.frame = CGRectMake(-80, 125, 500, 300);
    //mpcontroller.view.frame = CGRectMake(-80, 80, 480, 300);
    [mpcontroller.view setTransform:CGAffineTransformMakeRotation(90.0f *(M_PI/180.0f))];
    
    //设置电影结束后的回调方法，注册自己为observer
    //当MPMovicePlayerPlaybackDidFinishNotification事件发生时，就调用指定的方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callbackFunction:) name:MPMoviePlayerPlaybackDidFinishNotification object:mpcontroller];
    
    //设置播放器的一些属性
    mpcontroller.fullscreen = YES; //全屏
    mpcontroller.scalingMode = MPMovieScalingModeFill;
    //mpcontroller.controlStyle = MPMovieControlStyleNone;
    //播放电影
    [mpcontroller play];
    
    [super viewDidLoad];
}

//电影结束后的回调方法
- (void) callbackFunction: (NSNotification *) notification{
    MPMoviePlayerController *video = [notification object]; //也可以直接使用mpcontrol
    //从通知中心注销自己
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:video];
    video = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) shouldAutorotate
{
    return NO;
}



@end
