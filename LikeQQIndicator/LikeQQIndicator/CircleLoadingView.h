//
//  CircleLoadingView.h
//  LikeQQIndicator
//
//  Created by panda zheng on 14-5-15.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLoadingView : UIView

@property (nonatomic,assign) CGFloat anglePer;

@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,assign) CGFloat lineWidth;

@property (nonatomic,strong) UIColor *lineColor;

@property (nonatomic,readonly) BOOL isAnimating;

- (id) initWithFrame:(CGRect)frame;

- (void) startAnimation;
- (void) stopAnimation;

@end
