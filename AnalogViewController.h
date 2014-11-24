//
//  AnalogViewController.h
//  TAH
//
//  Created by Dhiraj on 08/08/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAHble.h"
#import "MACircleProgressIndicator.h"


@class TAHble;
@class CBPeripheral;

@interface AnalogViewController : UIViewController<BTSmartSensorDelegate>
{
    NSTimer *TAHstatusupdatetimer;
    
    IBOutlet UIScrollView *Scroller;
    IBOutlet UILabel *ConnectionStatusLabel;
    
    IBOutlet UILabel *a0ProgressLabel;
    IBOutlet UILabel *a1ProgressLabel;
    IBOutlet UILabel *a2ProgressLabel;
    IBOutlet UILabel *a3ProgressLabel;
    IBOutlet UILabel *a4ProgressLabel;
    IBOutlet UILabel *a5ProgressLabel;
}


@property (strong, nonatomic) TAHble *sensor;
@property (strong, nonatomic) CBPeripheral *peripheral;


@property (strong, nonatomic) IBOutlet MACircleProgressIndicator *a0progress;
@property (strong, nonatomic) IBOutlet MACircleProgressIndicator *a1progress;
@property (strong, nonatomic) IBOutlet MACircleProgressIndicator *a2progress;
@property (strong, nonatomic) IBOutlet MACircleProgressIndicator *a3progress;
@property (strong, nonatomic) IBOutlet MACircleProgressIndicator *a4progress;
@property (strong, nonatomic) IBOutlet MACircleProgressIndicator *a5progress;


@end
