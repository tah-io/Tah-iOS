//
//  TAHPWMViewController.h
//  TAH
//
//  Created by Dhiraj on 04/08/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import "TAHble.h"
#import "MACircleProgressIndicator.h"


@class TAHble;
@class CBPeripheral;

@interface TAHPWMViewController : UIViewController<BTSmartSensorDelegate>
{
    IBOutlet UISegmentedControl *PWMtypesegment;
    
    IBOutlet UIScrollView *Scroller;
    
    IBOutlet UISlider *D3Slider;
    IBOutlet UISlider *D5Slider;
    IBOutlet UISlider *D6Slider;
    IBOutlet UISlider *D9Slider;
    IBOutlet UISlider *D10Slider;
    IBOutlet UISlider *D11Slider;
    IBOutlet UISlider *D13Slider;
    
    IBOutlet UILabel *D3Sliderlabel;
    IBOutlet UILabel *D5Sliderlabel;
    IBOutlet UILabel *D6Sliderlabel;
    IBOutlet UILabel *D9Sliderlabel;
    IBOutlet UILabel *D10Sliderlabel;
    IBOutlet UILabel *D11Sliderlabel;
    IBOutlet UILabel *D13Sliderlabel;
    
    
    IBOutlet UILabel *ConnectionStatusLabel;

    
}


@property (strong, nonatomic) TAHble *sensor;
@property (strong, nonatomic) CBPeripheral *peripheral;


- (IBAction)D3Slider:(id)sender;
- (IBAction)D5Slider:(id)sender;
- (IBAction)D6Slider:(id)sender;
- (IBAction)D9Slider:(id)sender;
- (IBAction)D10Slider:(id)sender;
- (IBAction)D11Slider:(id)sender;
- (IBAction)D13Slider:(id)sender;


- (IBAction)PWMtypesegment:(id)sender;


@end
