//
//  ViewController.h
//  TeenLocator
//
//  Created by Paulo Brazil Mazzeo on 09/10/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
	CLLocation *local;
	CLLocationManager *GPS;
	IBOutlet UILabel *Label1;

}


-(IBAction)Locateme;


@end
