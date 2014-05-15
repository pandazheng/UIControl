//
//  IndicatorViewController.m
//  YahooIndicator
//
//  Created by panda zheng on 14-5-14.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "IndicatorViewController.h"
#import "RSLoadingIndicator.h"

@interface IndicatorViewController () <RSLoadingIndicatorDelegate>
{
    RSLoadingIndicator *indicator;
    UIButton *button;
    NSTimer *ticker;
    NSTimer *stopTimer;
}

@end

@implementation IndicatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    indicator = [[RSLoadingIndicator alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    indicator.delegate = self;
    [self.view addSubview:indicator];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:NSLocalizedString(@"Restart", nil) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    
    CGRect frame = button.frame;
    frame.origin.x = roundf((self.view.bounds.size.width - frame.size.width) / 2.0f);
    frame.origin.y = 100;
    button.frame = frame;
    [indicator addSubview:button];
    button.enabled = NO;
    
    ticker = [NSTimer scheduledTimerWithTimeInterval:1.0f / 33.0f target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

- (void) buttonClicked: (id) sender
{
    ticker = [NSTimer scheduledTimerWithTimeInterval:1.0f / 33.0f target:self selector:@selector(tick) userInfo:nil repeats:YES];
    button.enabled = NO;
}

- (void) tick
{
    [indicator didScroll:0.5f];
}

- (void) stop
{
    [indicator stopLoading];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- RSLoadingIndicatorDelegate
- (void) startLoading
{
    stopTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(stop) userInfo:nil repeats:NO];
}

- (void) stopLoading
{
    [ticker invalidate];
    ticker = nil;
    
    [stopTimer invalidate];
    stopTimer = nil;
    
    button.enabled = YES;
}

@end
