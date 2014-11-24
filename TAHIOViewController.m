//
//  TAHIOViewController.m
//  TAH
//
//  Created by Dhiraj on 04/08/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "TAHIOViewController.h"
#import "TAHble.h"


@interface TAHIOViewController ()
{
    
    NSString *command, *anaPin, *anaValue;
    float indicatorvalueinfloat;
    int indicatorvalueininteger;
}
@end

@implementation TAHIOViewController


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


    
    // Sets TAH class delegate
    self.sensor.delegate = self;
    


    ////// Setting Circle Progress Indicator ////////
    
    // You can use Appearance Proxy to style the MACircleProgressIndicator
    MACircleProgressIndicator *appearance = [MACircleProgressIndicator appearance];
    
    // The color property sets the actual color of the procress circle (how
    // suprising ;) )
    appearance.color = [UIColor colorWithRed:255.0 / 255.0 green:128.0 / 255.0 blue:0.0 / 255.0 alpha:1.0];
    
    
    
    ////// Status Led Blink Animation //////
    
    [self ledanimationstart];
    
    
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
    
    
    
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




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//recv data
-(void) TAHbleCharValueUpdated:(NSString *)UUID value:(NSData *)data
{
    NSString *value = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];

    
    NSLog(@"%@",value);

    

    
    //[self updateAnalogIndicator];
    [self updateDigitalSwitch];
    
}






-(void)updateDigitalSwitch
{
    indicatorvalueininteger = [anaValue intValue];
    
    
    if ([anaPin  isEqual: @"D2"]  && indicatorvalueininteger == 1 && D2switch.on == NO)
    {
        
        D2switch.on = YES;
    }
    else if ([anaPin  isEqual: @"D2"]  && indicatorvalueininteger == 0 && D2switch.on == YES)
    {
        
        D2switch.on = NO;
    }
    
    
    
    if ([anaPin  isEqual: @"D3"]  && indicatorvalueininteger == 1 && D3switch.on == NO)
    {
        
        D3switch.on = YES;
        
    }
    else if ([anaPin  isEqual: @"D3"]  && indicatorvalueininteger == 0 && D3switch.on == YES)
    {
        
        D3switch.on = NO;
        
    }
    
    
    if ([anaPin  isEqual: @"D4"]  && indicatorvalueininteger == 1 && D4switch.on == NO)
    {
        D4switch.on = YES;
        
    }
    else if ([anaPin  isEqual: @"D4"]  && indicatorvalueininteger == 0 && D4switch.on == YES)
    {
        D4switch.on = NO;
        
    }
    
    
    if ([anaPin  isEqual: @"D5"]  && indicatorvalueininteger == 1 && D5switch.on == NO)
    {
        
        D5switch.on = YES;
        
    }
    else if ([anaPin  isEqual: @"D5"]  && indicatorvalueininteger == 0  && D5switch.on == YES)
    {
        
        D5switch.on = NO;
        
    }
    
    
    if ([anaPin  isEqual: @"D6"]  && indicatorvalueininteger == 1 && D6switch.on == NO)
    {
        D6switch.on = YES;
        
    }
    else if ([anaPin  isEqual: @"D6"]  && indicatorvalueininteger == 0  &&  D6switch.on == YES)
    {
        
        D6switch.on = NO;
        
    }
    
    
    if ([anaPin  isEqual: @"D7"]  && indicatorvalueininteger == 1  &&  D7switch.on == NO)
    {
        
        D7switch.on = YES;
        
    }
    else if ([anaPin  isEqual: @"D7"]  && indicatorvalueininteger == 0  &&  D7switch.on == YES)
    {
        
        D7switch.on = NO;
        
    }
    
    
    if ([anaPin  isEqual: @"D8"]  && indicatorvalueininteger == 1  &&  D8switch.on == NO)
    {
        
        D8switch.on = YES;
        
    }
    else if ([anaPin  isEqual: @"D8"]  && indicatorvalueininteger == 0  &&  D8switch.on == YES)
    {
        D8switch.on = NO;
        
    }
    
    
    if ([anaPin  isEqual: @"D9"]  && indicatorvalueininteger == 1  &&  D9switch.on == NO)
    {
        
        D9switch.on = YES;
        
    }
    else if ([anaPin  isEqual: @"D9"]  && indicatorvalueininteger == 0  &&  D9switch.on == YES)
    {
        
        D9switch.on = NO;
        
    }
    
    
    if ([anaPin  isEqual: @"D10"]  && indicatorvalueininteger == 1  &&  D10switch.on == NO)
    {
        
        D10switch.on = YES;
        
    }
    else if ([anaPin  isEqual: @"D10"]  && indicatorvalueininteger == 0  && D10switch.on == YES)
    {
        
        D10switch.on = NO;
        
    }
    
    
    if ([anaPin  isEqual: @"D11"]  && indicatorvalueininteger == 1  &&  D11switch.on == NO)
    {
        D11switch.on = YES;
        
    }
    else if ([anaPin  isEqual: @"D11"]  && indicatorvalueininteger == 0  &&  D11switch.on == YES)
    {
        
        D11switch.on = NO;
        
    }
    
    
    if ([anaPin  isEqual: @"D12"]  && indicatorvalueininteger == 1  &&  D12switch.on == NO)
    {
        
        D12switch.on = YES;
        
    }
    else if ([anaPin  isEqual: @"D12"]  && indicatorvalueininteger == 0  &&  D12switch.on == YES)
    {
        
        D12switch.on = NO;
        
    }
    
    
    if ([anaPin  isEqual: @"D13"]  && indicatorvalueininteger == 1  && D13switch.on == NO)
    {
        
        D13switch.on = YES;
        tahL13led.image = [UIImage imageNamed:@"ledg"] ;
        
    }
    
    
    else if ([anaPin  isEqual: @"D13"]  && indicatorvalueininteger == 0 && D13switch.on == YES)
    {
        
        D13switch.on = NO;
        tahL13led.image = [UIImage imageNamed:@"ledoff"] ;

    }
    
    
    
    
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
    
    
    
    [self ledanimationstart];

    
}



-(void)ledanimationstart
{
    
    if (sensor.activePeripheral.state == 0)
    {
        NSArray *images=[NSArray arrayWithObjects:[UIImage imageNamed:@"ledoff"],[UIImage imageNamed:@"ledb"],nil];
        
        blestatusled.animationImages  = images;
        blestatusled.animationDuration = 1;
        blestatusled.animationRepeatCount = -1;
        
        [blestatusled startAnimating];
    }
    
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



- (IBAction)D2switch:(id)sender {
    
    if (D2switch.on)
    {
        [sensor TAHPin2digitalWrite:sensor.activePeripheral HIGH:YES];
    }
    
    else
    {
        [sensor TAHPin2digitalWrite:sensor.activePeripheral HIGH:NO];
    }
    
    
}


- (IBAction)D3switch:(id)sender {
    
    if (D3switch.on)
    {
        [sensor TAHPin3digitalWrite:sensor.activePeripheral HIGH:YES];
    }
    
    else
    {
        [sensor TAHPin3digitalWrite:sensor.activePeripheral HIGH:NO];
    }
    
    
}


- (IBAction)D4switch:(id)sender {
    
    if (D4switch.on)
    {
        [sensor TAHPin4digitalWrite:sensor.activePeripheral HIGH:YES];
    }
    
    else
    {
        [sensor TAHPin4digitalWrite:sensor.activePeripheral HIGH:NO];
        
    }
    
    
}



- (IBAction)D5switch:(id)sender {
    
    if (D5switch.on)
    {
        [sensor TAHPin5digitalWrite:sensor.activePeripheral HIGH:YES];
    }
    
    else
    {
        [sensor TAHPin5digitalWrite:sensor.activePeripheral HIGH:NO];
        
    }
    
    
}



- (IBAction)D6switch:(id)sender {
    
    if (D6switch.on)
    {
        [sensor TAHPin6digitalWrite:sensor.activePeripheral HIGH:YES];
    }
    
    else
    {
        [sensor TAHPin6digitalWrite:sensor.activePeripheral HIGH:NO];
        
    }
    
    
}



- (IBAction)D7switch:(id)sender {
    
    if (D7switch.on)
    {
        [sensor TAHPin7digitalWrite:sensor.activePeripheral HIGH:YES];
    }
    
    else
    {
        [sensor TAHPin7digitalWrite:sensor.activePeripheral HIGH:NO];
    }
    
    
}



- (IBAction)D8switch:(id)sender {
    
    if (D8switch.on)
    {
        [sensor TAHPin8digitalWrite:sensor.activePeripheral HIGH:YES];
    }
    
    else
    {
        [sensor TAHPin8digitalWrite:sensor.activePeripheral HIGH:NO];
        
    }
    
    
}



- (IBAction)D9switch:(id)sender {
    
    if (D9switch.on)
    {
        [sensor TAHPin9digitalWrite:sensor.activePeripheral HIGH:YES];
    }
    
    else
    {
        [sensor TAHPin9digitalWrite:sensor.activePeripheral HIGH:NO];
        
    }
    
    
}



- (IBAction)D10switch:(id)sender {
    
    if (D10switch.on)
    {
        [sensor TAHPin10digitalWrite:sensor.activePeripheral HIGH:YES];
    }
    
    else
    {
        [sensor TAHPin10digitalWrite:sensor.activePeripheral HIGH:NO];
        
    }
    
    
}



- (IBAction)D11switch:(id)sender {
    
    if (D11switch.on)
    {
        [sensor TAHPin11digitalWrite:sensor.activePeripheral HIGH:YES];
    }
    
    else
    {
        [sensor TAHPin11digitalWrite:sensor.activePeripheral HIGH:NO];
    }
    
    
}



- (IBAction)D12switch:(id)sender {
    
    if (D12switch.on)
    {
        [sensor TAHPin12digitalWrite:sensor.activePeripheral HIGH:YES];
    }
    
    else
    {
        [sensor TAHPin12digitalWrite:sensor.activePeripheral HIGH:NO];
    }
    
    
}



- (IBAction)D13switch:(id)sender {
    
    if (D13switch.on)
    {
        [sensor TAHPin13digitalWrite:sensor.activePeripheral HIGH:YES];
        tahL13led.image = [UIImage imageNamed:@"ledb"] ;

    }
    
    else
    {
        
        [sensor TAHPin13digitalWrite:sensor.activePeripheral HIGH:NO];
        tahL13led.image = [UIImage imageNamed:@"ledoff"] ;

        
    }
    
    
}



@end
