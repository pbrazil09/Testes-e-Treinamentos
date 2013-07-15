//
//  MainViewController.h
//  PetAngel
//
//  Created by Paulo Brazil Mazzeo on 13/12/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>
#import "Pet.h"


@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>
{
	NSManagedObjectContext *ManagedObjectContext;
	IBOutlet UILabel *labelteste;
	IBOutlet UILabel *labelfetch;
	
}

@property (strong, nonatomic) NSManagedObjectContext *ManagedObjectContext;

- (IBAction)showInfo:(id)sender;
//-(id) initWithContext:(NSManagedObjectContext *) _context;

@end
