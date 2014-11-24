//
//  AnalogViewController.m
//  TAH
//
//  Created by Dhiraj on 08/08/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.
//

#import "AnalogViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "TAHble.h"

@interface AnalogViewController ()
{
    NSString *command, *anaPin, *anaValue;
    float indicatorvalueinfloat;
    int indicatorvalueininteger;
}
@end

@implementation AnalogViewController

@synthesize sensor;
@synthesize peripheral;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Sets TAH class delegate
    self.sensor.delegate = self;
    
    // Set Scroll View for iPhone 3.5 inch
    [Scroller setScrollEnabled:YES];
    [Scroller setContentSize:CGSizeMake(320, 500)];
    
    
    
    ////// Setting Circle Progress Indicator ////////
    
    // You can use Appearance Proxy to style the MACircleProgressIndicator
    MACircleProgressIndicator *appearance = [MACircleProgressIndicator appearance];
    
    // The color property sets the actual color of the procress circle (how
    // suprising ;) )
    appearance.color = [UIColor colorWithRed:255.0 / 255.0 green:128.0 / 255.0 blue:0.0 / 255.0 alpha:1.0];

    
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
    
    ///////// TAH Status Update Timer //////////
    
    TAHstatusupdatetimer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                            target:self
                                                          selector:@selector(UpdateTAHStatus:)
                                                          userInfo:nil
                                                           repeats:YES];

    
    
}


-(void) viewWillDisappear:(BOOL)animated
{
   [TAHstatusupdatetimer invalidate];
}



-(void)UpdateTAHStatus:(NSTimer *)theTimer
{
    if(sensor.activePeripheral.state)
    {
        [sensor updateTAHAnalogStatus:sensor.activePeripheral UpdateStatus:YES];
    }
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
}



///////////// Update Device Connection Status Image //////////
-(void)UpdateConnectionStatusLabel
{
    
    
    if (sensor.activePeripheral.state)
    {
        
        ConnectionStatusLabel.backgroundColor = [UIColor colorWithRed:128.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0];
    }
    else
    {
        
        ConnectionStatusLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:128.0/255.0 blue:0.0/255.0 alpha:1.0];
    }
}




//recv data
-(void) TAHbleCharValueUpdated:(NSString *)UUID value:(NSData *)data
{
    NSString *value = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    
    
    
    NSArray *incomedata = [value componentsSeparatedByString: @":"];
    anaPin = [incomedata firstObject];
    anaValue = [incomedata objectAtIndex:1];

    
    [self updateAnalogIndicator];

    
}




// Update Analog Values of TAH analog pins

-(void) updateAnalogIndicator
{
    
    indicatorvalueinfloat = [anaValue floatValue];
    indicatorvalueininteger = [anaValue intValue];
    
    
    if ([anaPin  isEqual: @"A0"])
    {
        
        self.a0progress.value = indicatorvalueinfloat/1000;
        a0ProgressLabel.text = [NSString stringWithFormat:@"%d",indicatorvalueininteger];
        
    }
    
    else if ([anaPin  isEqual: @"A1"])
    {
        self.a1progress.value = indicatorvalueinfloat/1000;
        a1ProgressLabel.text = [NSString stringWithFormat:@"%d",indicatorvalueininteger];
    }
    
    else if ([anaPin  isEqual: @"A2"])
    {
        self.a2progress.value = indicatorvalueinfloat/1000;
        a2ProgressLabel.text = [NSString stringWithFormat:@"%d",indicatorvalueininteger];
    }
    
    else if ([anaPin  isEqual: @"A3"])
    {
        self.a3progress.value = indicatorvalueinfloat/1000;
        a3ProgressLabel.text = [NSString stringWithFormat:@"%d",indicatorvalueininteger];
    }
    
    else if ([anaPin  isEqual: @"A4"])
    {
        self.a4progress.value = indicatorvalueinfloat/1000;
        a4ProgressLabel.text = [NSString stringWithFormat:@"%d",indicatorvalueininteger];
    }
    
    else if ([anaPin  isEqual: @"A5"])
    {
        self.a5progress.value = indicatorvalueinfloat/1000;
        a5ProgressLabel.text = [NSString stringWithFormat:@"%d",indicatorvalueininteger];
    }
    
    
}


-(void)setConnect
{
    CFStringRef s = CFUUIDCreateString(kCFAllocatorDefault, (__bridge CFUUIDRef )sensor.activePeripheral.identifier);
    NSLog(@"%@",(__bridge NSString*)s);
    
}

-(void)setDisconnect
{
    
    [sensor disconnect:sensor.activePeripheral];
    
    NSLog(@"TAH Device Disconnected");
    
    
    //////// Local Alert Settings
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);

    /////////////////////////////////////////////
    
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
    
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
