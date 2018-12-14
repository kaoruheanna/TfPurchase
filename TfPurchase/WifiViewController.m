//
//  WifiViewController.m
//  TfPurchase
//
//  Created by Kaoru Heanna on 12/14/18.
//  Copyright © 2018 Kaoru Heanna. All rights reserved.
//

#import "WifiViewController.h"
#import "Reachability.h"

@interface WifiViewController ()

@end

@implementation WifiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"en wifi view controller");
    [self updateWifi];
    // Do any additional setup after loading the view.
}

- (void)updateWifi {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable){
        [self.wifiLabel setText:@"NO ANDA"];
        [self.wifiLabel setTextColor:[UIColor redColor]];
    } else if (status == ReachableViaWiFi) {
        [self.wifiLabel setText:@"OK"];
        [self.wifiLabel setTextColor:[UIColor greenColor]];
    } else if (status == ReachableViaWWAN) {
        NSLog(@"3G");
    }
}

- (IBAction)recheckButtonPressed:(id)sender {
    [self updateWifi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
