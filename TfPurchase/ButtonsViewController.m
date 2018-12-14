//
//  ButtonsViewController.m
//  TfPurchase
//
//  Created by Kaoru Heanna on 12/14/18.
//  Copyright © 2018 Kaoru Heanna. All rights reserved.
//

#import "ButtonsViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface ButtonsViewController ()

@property float currentVolume;

@end

@implementation ButtonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"view did appear");
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:true error:nil];
    [audioSession addObserver:self forKeyPath:@"outputVolume" options:0 context:nil];
    self.currentVolume = audioSession.outputVolume;
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"key path: %@", keyPath);
    
    if ([keyPath isEqual:@"outputVolume"]) {
        NSLog(@"volume changed!");
        [self volumeDidChange];
    }
}

- (void)volumeDidChange {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    float newVolume = audioSession.outputVolume;
    NSLog(@"output volume: %f",newVolume);
    
    if (newVolume < self.currentVolume) {
        [self.volumeLabel setText:@"Volumen Bajó"];
    } else if (newVolume > self.currentVolume) {
        [self.volumeLabel setText:@"Volumen Subió"];
    }
    self.currentVolume = newVolume;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
