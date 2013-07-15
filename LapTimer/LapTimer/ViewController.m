//
//  ViewController.m
//  LapTimer
//
//  Created by Paulo Brazil Mazzeo on 08/12/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)addTime:(id)sender {
	
	
    Events *event = [NSEntityDescription insertNewObjectForEntityForName:@"Events" inManagedObjectContext:managedObjectContext];
    [Events setTimeStamp: [NSDate date]];
    NSError *error;
    if(![managedObjectContext save:&error]){
        //This is a serious error saying the record
        //could not be saved. Advise the user to
        //try again or restart the application.
    }
    [eventArray insertObject:event atIndex:0];


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
