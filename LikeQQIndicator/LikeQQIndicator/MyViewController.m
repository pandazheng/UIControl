//
//  MyViewController.m
//  LikeQQIndicator
//
//  Created by panda zheng on 14-5-15.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "MyViewController.h"
#import "CircleLoadingView.h"

@interface MyViewController ()

@property (nonatomic,strong) CircleLoadingView *loadingView;
@property (nonatomic,strong) UIButton *startButton;
@property (nonatomic,strong) UIButton *stopButton;

@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Test";
    
    self.loadingView = [[CircleLoadingView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    UIBarButtonItem *loadingItem = [[UIBarButtonItem alloc] initWithCustomView:self.loadingView];
    self.navigationItem.leftBarButtonItem = loadingItem;
    
    self.startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.startButton setTitle:@"开始动画" forState:UIControlStateNormal];
    self.startButton.frame = CGRectMake(20, 64, 60, 30);
    [self.startButton addTarget:self action:@selector(startButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startButton];
    
    self.stopButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.stopButton setTitle:@"结束动画" forState:UIControlStateNormal];
    self.stopButton.frame = CGRectMake(20, 94, 60, 30);
    [self.stopButton addTarget:self
                        action:@selector(stopButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.stopButton];
}

- (void) startButtonClick: (UIButton *) button
{
    [self.loadingView startAnimation];
}

- (void) stopButtonClick: (UIButton *) button
{
    [self.loadingView stopAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
