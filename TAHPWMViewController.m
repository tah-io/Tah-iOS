//
//  TAHPWMViewController.m
//  TAH
//
//  Created by Dhiraj on 04/08/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.
//


#import <AudioToolbox/AudioToolbox.h>
#import "TAHPWMViewController.h"

@interface TAHPWMViewController ()

@end

@implementation TAHPWMViewController

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
    
    
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
    
    // Set Scroll View for iPhone 3.5 inch
    [Scroller setScrollEnabled:YES];
    [Scroller setContentSize:CGSizeMake(320, 500)];

}

-(void)viewWillAppear:(BOOL)animated
{
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    
    NSLog(@"Received Data:%@",value);
}






// Called when TAH is connected
-(void)setConnect
{
    CFStringRef s = CFUUIDCreateString(kCFAllocatorDefault, (__bridge CFUUIDRef )sensor.activePeripheral.identifier);
    NSLog(@"%@",(__bridge NSString*)s);
    
}


// Called when TAH is Disconnected
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



- (IBAction)D3Slider:(id)sender
{
    if (PWMtypesegment.selectedSegmentIndex == 0)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D3Slider.value*255];
        int data = [Value intValue];
        [sensor TAHPin3analogWrite:sensor.activePeripheral Value:data];
    }
    else if (PWMtypesegment.selectedSegmentIndex == 1)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D3Slider.value*179];
        int data = [Value intValue];
        [sensor TAHPin3Servo:sensor.activePeripheral angle:data];
    }
    
    [self updateSliderLabel];
    
}



- (IBAction)D5Slider:(id)sender
{
    
    if (PWMtypesegment.selectedSegmentIndex == 0)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D5Slider.value*255];
        int data = [Value intValue];
        [sensor TAHPin5analogWrite:sensor.activePeripheral Value:data];
    }
    else if (PWMtypesegment.selectedSegmentIndex == 1)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D5Slider.value*179];
        int data = [Value intValue];
        [sensor TAHPin5Servo:sensor.activePeripheral angle:data];
    }
    
    [self updateSliderLabel];
}


- (IBAction)D6Slider:(id)sender
{
    
    if (PWMtypesegment.selectedSegmentIndex == 0)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D6Slider.value*255];
        int data = [Value intValue];
        [sensor TAHPin6analogWrite:sensor.activePeripheral Value:data];
    }
    else if (PWMtypesegment.selectedSegmentIndex == 1)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D6Slider.value*179];
        int data = [Value intValue];
        [sensor TAHPin6Servo:sensor.activePeripheral angle:data];
    }
    
    [self updateSliderLabel];
    
    
}



- (IBAction)D9Slider:(id)sender
{
    
    if (PWMtypesegment.selectedSegmentIndex == 0)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D9Slider.value*255];
        int data = [Value intValue];
        [sensor TAHPin9analogWrite:sensor.activePeripheral Value:data];
    }
    else if (PWMtypesegment.selectedSegmentIndex == 1)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D9Slider.value*179];
        int data = [Value intValue];
        [sensor TAHPin9Servo:sensor.activePeripheral angle:data];
    }
    
    [self updateSliderLabel];
    
    
}



- (IBAction)D10Slider:(id)sender
{
    
    if (PWMtypesegment.selectedSegmentIndex == 0)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D10Slider.value*255];
        int data = [Value intValue];
        [sensor TAHPin10analogWrite:sensor.activePeripheral Value:data];
    }
    else if (PWMtypesegment.selectedSegmentIndex == 1)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D10Slider.value*179];
        int data = [Value intValue];
        [sensor TAHPin10Servo:sensor.activePeripheral angle:data];
    }
    
    [self updateSliderLabel];
    
    
}



- (IBAction)D11Slider:(id)sender
{
    
    if (PWMtypesegment.selectedSegmentIndex == 0)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D11Slider.value*255];
        int data = [Value intValue];
        [sensor TAHPin11analogWrite:sensor.activePeripheral Value:data];
    }
    else if (PWMtypesegment.selectedSegmentIndex == 1)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D11Slider.value*179];
        int data = [Value intValue];
        [sensor TAHPin11Servo:sensor.activePeripheral angle:data];
    }
    
    [self updateSliderLabel];
    
}



- (IBAction)D13Slider:(id)sender
{
    
    if (PWMtypesegment.selectedSegmentIndex == 0)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D13Slider.value*255];
        int data = [Value intValue];
        [sensor TAHPin13analogWrite:sensor.activePeripheral Value:data];
    }
    else if (PWMtypesegment.selectedSegmentIndex == 1)
    {
        NSString *Value = [NSString stringWithFormat:@"%f",D13Slider.value*179];
        int data = [Value intValue];
        [sensor TAHPin13Servo:sensor.activePeripheral angle:data];
    }
    
    [self updateSliderLabel];
    
}



- (IBAction)PWMtypesegment:(id)sender
{
    
    if (PWMtypesegment.selectedSegmentIndex == 1)
    {
        D3Slider.value = 0.5;
        D5Slider.value = 0.5;
        D6Slider.value = 0.5;
        D9Slider.value = 0.5;
        D10Slider.value = 0.5;
        D11Slider.value = 0.5;
        D13Slider.value = 0.5;
    }
    
    else
    {
        D3Slider.value = 0.0;
        D5Slider.value = 0.0;
        D6Slider.value = 0.0;
        D9Slider.value = 0.0;
        D10Slider.value = 0.0;
        D11Slider.value = 0.0;
        D13Slider.value = 0.0;
    }
    
    [self updateSliderLabel];
}


-(void)updateSliderLabel
{
    if (PWMtypesegment.selectedSegmentIndex == 1)
    {
        D3Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D3Slider.value*180];
        D3Sliderlabel.center = CGPointMake(D3Slider.center.x,D3Sliderlabel.center.y);
        
        
        
        D5Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D5Slider.value*180];
        D5Sliderlabel.center = CGPointMake(D5Slider.center.x,D5Sliderlabel.center.y);
        
        
        
        D6Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D6Slider.value*180];
        D6Sliderlabel.center = CGPointMake(D6Slider.center.x,D6Sliderlabel.center.y);
        
        
        
        D9Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D9Slider.value*180];
        D9Sliderlabel.center = CGPointMake(D9Slider.center.x,D9Sliderlabel.center.y);
        
        
        
        D10Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D10Slider.value*180];
        D10Sliderlabel.center = CGPointMake(D10Slider.center.x,D10Sliderlabel.center.y);
        
        
        
        D11Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D11Slider.value*180];
        D11Sliderlabel.center = CGPointMake(D11Slider.center.x,D11Sliderlabel.center.y);
        
        
        
        D13Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D13Slider.value*180];
        D13Sliderlabel.center = CGPointMake(D13Slider.center.x,D13Sliderlabel.center.y);
        
    }
    else
    {
        
        NSString *D3Value = [NSString stringWithFormat:@"%f",D3Slider.value*255];
        NSString *D5Value = [NSString stringWithFormat:@"%f",D5Slider.value*255];
        NSString *D6Value = [NSString stringWithFormat:@"%f",D6Slider.value*255];
        NSString *D9Value = [NSString stringWithFormat:@"%f",D9Slider.value*255];
        NSString *D10Value = [NSString stringWithFormat:@"%f",D10Slider.value*255];
        NSString *D11Value = [NSString stringWithFormat:@"%f",D11Slider.value*255];
        NSString *D13Value = [NSString stringWithFormat:@"%f",D13Slider.value*255];
        
        
        int value3 = [D3Value intValue];
        int value5 = [D5Value intValue];
        int value6 = [D6Value intValue];
        int value9 = [D9Value intValue];
        int value10 = [D10Value intValue];
        int value11 = [D11Value intValue];
        int value13 = [D13Value intValue];
        
        
        
        D3Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D3Slider.value*255];
        D5Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D5Slider.value*255];
        D6Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D6Slider.value*255];
        D9Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D9Slider.value*255];
        D10Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D10Slider.value*255];
        D11Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D11Slider.value*255];
        D13Sliderlabel.text = [NSString stringWithFormat:@"%.0f",D13Slider.value*255];
        
        
        if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
        {
        D3Sliderlabel.center = CGPointMake((value3 + 36.0),D3Sliderlabel.center.y);
            D5Sliderlabel.center = CGPointMake((value5 + 36.0),D5Sliderlabel.center.y);
            D6Sliderlabel.center = CGPointMake((value6 + 36.0),D6Sliderlabel.center.y);
            D9Sliderlabel.center = CGPointMake((value9 + 36.0),D9Sliderlabel.center.y);
            D10Sliderlabel.center = CGPointMake((value10 + 36.0),D10Sliderlabel.center.y);
            D11Sliderlabel.center = CGPointMake((value11 + 36.0),D11Sliderlabel.center.y);
            D13Sliderlabel.center = CGPointMake((value13 + 36.0),D13Sliderlabel.center.y);
        }
        
        else
        {
        D3Sliderlabel.center = CGPointMake((value3 + 256.0),D3Sliderlabel.center.y);
        D5Sliderlabel.center = CGPointMake((value5 + 256.0),D5Sliderlabel.center.y);
        D6Sliderlabel.center = CGPointMake((value6 + 256.0),D6Sliderlabel.center.y);
        D9Sliderlabel.center = CGPointMake((value9 + 256.0),D9Sliderlabel.center.y);
        D10Sliderlabel.center = CGPointMake((value10 + 256.0),D10Sliderlabel.center.y);
        D11Sliderlabel.center = CGPointMake((value11 + 256.0),D11Sliderlabel.center.y);
        D13Sliderlabel.center = CGPointMake((value13 + 256.0),D13Sliderlabel.center.y);
        }
        
        
        
 
        
    
    }
}

@end
