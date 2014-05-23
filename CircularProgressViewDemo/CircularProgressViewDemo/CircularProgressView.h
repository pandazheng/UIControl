//
//  CircularProgressView.h
//  CircularProgressViewDemo
//
//  Created by panda zheng on 14-5-18.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol CircularProgressViewDelegate <NSObject>

@optional

- (void) updateProgressViewWithPlayer: (AVAudioPlayer *) player;
- (void) playerDidFinishPlaying;

@end

@interface CircularProgressView : UIView

@property (nonatomic) UIColor *backColor;
@property (nonatomic) UIColor *progressColor;
@property (nonatomic,copy) NSString *audioPath;
@property (nonatomic,assign) CGFloat lineWidth;
@property (nonatomic,assign) NSTimeInterval duration;
@property (nonatomic,assign) BOOL playOrPauseButtonIsPlaying;
@property (nonatomic,assign) id <CircularProgressViewDelegate> delegate;

- (id) initWithFrame:(CGRect)frame backColor:(UIColor *) backColor progressColor:(UIColor *) progressColor lineWidth:(CGFloat) lineWidth audioPath:(NSString *) path;

- (void) play;
- (void) pause;
- (void) stop;

@end
