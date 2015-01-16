//
//  TAHbleTableController.h
//  Created by DHIRAJ JADHAO on 21/05/14.
//  Copyright (c) 2014 DHIRAJJADHAO. All rights reserved.
//



#import <UIKit/UIKit.h>

#import "TAHble.h"

@class BLEDeviceViewController;

@interface TAHbleTableController : UIViewController<BTSmartSensorDelegate, UITableViewDelegate, UITableViewDataSource>
{

    IBOutlet UIButton *home;
    
    IBOutlet UILabel *ConnectionStatusLabel;

}

@property (strong, nonatomic) TAHble *sensor;
@property (nonatomic, retain) NSMutableArray *peripheralViewControllerArray;

- (IBAction)scanTAHDevices:(id)sender;

-(void) scanTimer:(NSTimer *)timer;

@property (weak, nonatomic) IBOutlet UITableView *TAHTableView;

@property (weak, nonatomic) IBOutlet UIButton *Scan;

- (IBAction)home:(id)sender;


@end
