//
//  SpeechViewController.m
//  TextToSpeech
//
//  Created by panda zheng on 14-5-22.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "SpeechViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface SpeechViewController ()

@end

@implementation SpeechViewController
@synthesize tf,player;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [self disposeSound];
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) speak
{
	NSString *loc=[@"http://www.langspeech.com/voiceproxy.php?url=tts4all&langvoc=mdfe01rs&text="
				   stringByAppendingString:[tf.text stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
	NSURL *url=[NSURL URLWithString:loc];
	
	NSXMLParser *p = [[NSXMLParser alloc] initWithContentsOfURL:url];
	[p setDelegate:self];
	[p parse];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([string hasPrefix:@"http"])
    {
        AVPlayer *player2 = [AVPlayer playerWithURL:[NSURL URLWithString:string]];
        [player2 play];
    }
}

- (IBAction) playShortSound
{
    if (soundID == 0)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"damn" ofType:@"caff"];
        NSURL *url = [NSURL fileURLWithPath:path];
        
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    }
    
    AudioServicesPlaySystemSound(soundID);
}

- (void) pause
{
    [player pause];
}

- (void) play
{
    [player play];
}

- (IBAction) playLongSound
{
    if (!player)
    {
        NSError *error = nil;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hongloumeng" ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:path];
        
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        player.delegate = self;
    }
    
    if (player.playing)
    {
        
    }
    else
    {
        [self play];
    }
}

- (IBAction) skipForward
{
    player.currentTime = player.currentTime + 30.0;
}

- (IBAction) skipBack
{
    player.currentTime = player.currentTime - 30.0;
}

- (void) audioPlayerBeginInterruption:(AVAudioPlayer *) thePlayer
{
    if (thePlayer == player)
    {
        [self pause];
    }
}

- (void) audioPlayerEndInterruption:(AVAudioPlayer *) thePlayer withOptions:(NSUInteger)flags
{
    if (thePlayer == player)
    {
        [self play];
    }
}

- (void) disposeSound
{
    if (soundID)
    {
        AudioServicesDisposeSystemSoundID(soundID);
        soundID = 0;
    }
    
    player = nil;
}


@end
