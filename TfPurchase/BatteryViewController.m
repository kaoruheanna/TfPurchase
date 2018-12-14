//
//  BatteryViewController.m
//  TfPurchase
//
//  Created by Kaoru Heanna on 12/14/18.
//  Copyright © 2018 Kaoru Heanna. All rights reserved.
//

#import "BatteryViewController.h"

@interface BatteryViewController ()

@property (weak, nonatomic) IBOutlet UILabel *batteryLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *batteryStateLabel;

@end

@implementation BatteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:true];
    [self updateBatteryState];
}

- (IBAction)checkButtonPressed:(id)sender {
    [self updateBatteryState];
}

- (void)updateBatteryState {
    UIDevice *device = [UIDevice currentDevice];
    int batteryLevel = [device batteryLevel] * 100;
    [self.batteryLevelLabel setText:[NSString stringWithFormat:@"%d%%", batteryLevel]];
    
    UIDeviceBatteryState state = [device batteryState];
    if (state == UIDeviceBatteryStateUnknown){
        [self.batteryStateLabel setText:@"Desconocido"];
    } else if (state == UIDeviceBatteryStateUnplugged) {
        [self.batteryStateLabel setText:@"Desconectado, descargandose"];
    } else if (state == UIDeviceBatteryStateCharging) {
        [self.batteryStateLabel setText:@"Cargandose"];
    } else if (state == UIDeviceBatteryStateFull) {
        [self.batteryStateLabel setText:@"Cargado al 100%%"];
    }
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
