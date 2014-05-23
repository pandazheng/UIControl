//
//  SpeechViewController.h
//  TextToSpeech
//
//  Created by panda zheng on 14-5-22.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface SpeechViewController : UIViewController <NSXMLParserDelegate,AVAudioPlayerDelegate>
{
    SystemSoundID soundID;
    AVAudioPlayer *player;
}


@property (nonatomic,weak)  IBOutlet UITextField *tf;
@property (nonatomic,strong) AVAudioPlayer *player;

- (IBAction) playShortSound;
- (IBAction) playLongSound;
- (IBAction) pause;
- (IBAction) skipForward;
- (IBAction) skipBack;
- (IBAction) speak;
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;

@end
