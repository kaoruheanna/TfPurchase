//
//  AudioViewController.m
//  TfPurchase
//
//  Created by Kaoru Heanna on 12/14/18.
//  Copyright © 2018 Kaoru Heanna. All rights reserved.
//

#import "AudioViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioViewController ()

@property (strong) AVAudioPlayer *audioPlayer;

@end

@implementation AudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButtonPressed:(id)sender {
    [self playAudio];
}

- (void)playAudio {
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/nuevo_audio.m4a",[[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    [self.audioPlayer play];
}

@end
