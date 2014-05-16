//
//  DiskViewController.m
//  DiskGameDemo
//
//  Created by panda zheng on 14-5-15.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "DiskViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "math.h"

@interface DiskViewController ()

@end

@implementation DiskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
	// Do any additional setup after loading the view, typically from a nib.
    //添加转盘
    UIImageView *image_disk = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disk.jpg"]];
    image_disk.backgroundColor = [UIColor redColor];
    image_disk.frame = CGRectMake(0.0, 20.0, 320.0, 320.0);
    image1 = image_disk;
    [self.view addSubview:image1];
    
    //添加转针
    UIImageView *image_start = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"start.png"]];
    image_start.frame = CGRectMake(103.0, 75.0, 120.0, 210.0);
    image2 = image_start;
    [self.view addSubview:image2];
    
    //添加按钮
    UIButton *btn_start = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn_start.frame = CGRectMake(120.0, 350.0, 70.0, 210.0);
    [btn_start setTitle:@"抽奖" forState:UIControlStateNormal];
    [btn_start addTarget:self action:@selector(choujiang) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_start];
}

- (void) choujiang
{
    //旋转动画
    //生成随机角度
    srand((unsigned)time(0));
    random = (rand() % 20) / 10.0;
    //设置动画
    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [spin setFromValue:[NSNumber numberWithFloat:M_PI * (0.0 + orign)]];
    [spin setToValue:[NSNumber numberWithFloat:M_PI * (10.0+random+orign)]];
    [spin setDuration:2.5];
    [spin setDelegate:self];//设置代理，可以相应animationDidStop:finished:函数，用以弹出提醒框
    //速度控制器
    [spin setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    //添加动画
    [[image2 layer] addAnimation:spin forKey:nil];
    //锁定结束位置
    image2.transform = CGAffineTransformMakeRotation(M_PI * (10.0+random+orign));
    //锁定fromValue的位置
    orign = 10.0+random+orign;
    orign = fmodf(orign, 2.0);
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //判断抽奖结果
    if (orign >= 0.0 && orign < (0.5/3.0)) {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 一等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }
    else if (orign >= (0.5/3.0) && orign < ((0.5/3.0)*2))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= ((0.5/3.0)*2) && orign < ((0.5/3.0)*3))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 六等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (0.0+0.5) && orign < ((0.5/3.0)+0.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= ((0.5/3.0)+0.5) && orign < (((0.5/3.0)*2)+0.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 五等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (((0.5/3.0)*2)+0.5) && orign < (((0.5/3.0)*3)+0.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (0.0+1.0) && orign < ((0.5/3.0)+1.0))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 四等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= ((0.5/3.0)+1.0) && orign < (((0.5/3.0)*2)+1.0))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (((0.5/3.0)*2)+1.0) && orign < (((0.5/3.0)*3)+1.0))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 三等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (0.0+1.5) && orign < ((0.5/3.0)+1.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= ((0.5/3.0)+1.5) && orign < (((0.5/3.0)*2)+1.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 二等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (((0.5/3.0)*2)+1.5) && orign < (((0.5/3.0)*3)+1.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
