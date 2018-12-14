//
//  FingerprintViewController.m
//  TfPurchase
//
//  Created by Kaoru Heanna on 12/14/18.
//  Copyright © 2018 Kaoru Heanna. All rights reserved.
//

#import "FingerprintViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>


@interface FingerprintViewController ()

@end

@implementation FingerprintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)checkButtonPressed:(id)sender {
    [self checkFingerPrint];
}


-(void)checkFingerPrint {
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Authenticate using your finger";
    if (![myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        NSLog(@"Can not evaluate Touch ID: %@", authError.description);
        return;
    }
    
    [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
              localizedReason:myLocalizedReasonString
                        reply:^(BOOL success, NSError *error) {
                            if (success) {
                                NSLog(@"User is authenticated successfully");
                            } else {
                                switch (error.code) {
                                    case LAErrorAuthenticationFailed:
                                        NSLog(@"Authentication Failed");
                                        break;
                                        
                                    case LAErrorUserCancel:
                                        NSLog(@"User pressed Cancel button");
                                        break;
                                        
                                    case LAErrorUserFallback:
                                        NSLog(@"User pressed \"Enter Password\"");
                                        break;
                                        
                                    default:
                                        NSLog(@"Touch ID is not configured");
                                        break;
                                }
                                NSLog(@"Authentication Fails");
                            }
                        }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
