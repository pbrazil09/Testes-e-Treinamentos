//
//  ViewController.h
//  LapTimer
//
//  Created by Paulo Brazil Mazzeo on 08/12/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Events.h"

@interface ViewController : UIViewController <UITableViewDelegate>
{
	NSManagedObjectContext *managedObjectContext;
    NSMutableArray *eventArray;
}
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSMutableArray *eventArray;
- (void) fetchRecords;
- (void) addTime:(id)sender;


@end
