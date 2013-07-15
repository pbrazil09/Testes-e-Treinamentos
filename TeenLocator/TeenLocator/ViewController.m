//
//  ViewController.m
//  TeenLocator
//
//  Created by Paulo Brazil Mazzeo on 09/10/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(IBAction)Locateme
{
	
	
//	[GPS setDelegate:local];

	
	[GPS startUpdatingLocation];
//	local = [GPS location];
	
	local = GPS.location;
	[Label1 setText:local];
	
	
	
	
	
	[local release];
	[GPS release];

	
	
	
}






- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
