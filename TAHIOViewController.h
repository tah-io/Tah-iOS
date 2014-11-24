//
//  TAHIOViewController.h
//  TAH
//
//  Created by Dhiraj on 04/08/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAHble.h"
#import "MACircleProgressIndicator.h"


@class TAHble;
@class CBPeripheral;

@interface TAHIOViewController : UIViewController<BTSmartSensorDelegate>
{
    
    NSTimer *rabbitanimationtimer, *rabbitearanimationtimer;
  
    
    
    IBOutlet UISwitch *D2switch;
    IBOutlet UISwitch *D3switch;
    IBOutlet UISwitch *D4switch;
    IBOutlet UISwitch *D5switch;
    IBOutlet UISwitch *D6switch;
    IBOutlet UISwitch *D7switch;
    IBOutlet UISwitch *D8switch;
    IBOutlet UISwitch *D9switch;
    IBOutlet UISwitch *D10switch;
    IBOutlet UISwitch *D11switch;
    IBOutlet UISwitch *D12switch;
    IBOutlet UISwitch *D13switch;
    

    
    IBOutlet UIImageView *blestatusled;
    IBOutlet UIImageView *tahL13led;

    IBOutlet UILabel *ConnectionStatusLabel;

    
  
    
    
}


@property (strong, nonatomic) TAHble *sensor;
@property (strong, nonatomic) CBPeripheral *peripheral;








- (IBAction)D2switch:(id)sender;
- (IBAction)D3switch:(id)sender;
- (IBAction)D4switch:(id)sender;
- (IBAction)D5switch:(id)sender;
- (IBAction)D6switch:(id)sender;
- (IBAction)D7switch:(id)sender;
- (IBAction)D8switch:(id)sender;
- (IBAction)D9switch:(id)sender;
- (IBAction)D10switch:(id)sender;
- (IBAction)D11switch:(id)sender;
- (IBAction)D12switch:(id)sender;
- (IBAction)D13switch:(id)sender;




@end
