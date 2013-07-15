//
//  MainViewController.m
//  PetAngel
//
//  Created by Paulo Brazil Mazzeo on 13/12/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "Pet.h"



@interface MainViewController ()

@end

@implementation MainViewController
@synthesize ManagedObjectContext;



/*-(id) initWithContext:(NSManagedObjectContext *) _context;
{

	AppDelegate *delegate = [[AppDelegate alloc] init];
	
	context = [[UIApplication sharedApplication] delegate];
	
	return context;
	
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	Pet *newpet;
	newpet = [NSEntityDescription insertNewObjectForEntityForName:@"Pet" inManagedObjectContext:ManagedObjectContext];
	//	[newpet setValue:@"Toto" forKey:@"nome"];
	newpet.nome = @"bundao";
	
	
	NSError *erro;
	
	[ManagedObjectContext save:&erro];
	
	if (erro != nil)
	{
		[labelteste setText:@"Fudeu"];
	} else
	{
		[labelteste setText:@"OK"];
		
	}
	
	NSEntityDescription *descpet;
	descpet = [NSEntityDescription entityForName:@"Pet" inManagedObjectContext:ManagedObjectContext];
	
	NSFetchRequest *request = [[NSFetchRequest alloc]init];
	[request setEntity:descpet];
	NSArray *resultado = [ManagedObjectContext executeFetchRequest:request error:&erro];
	
//	labelfetch.text = @"@%i",[resultado count];
	NSLog(@"%i",[resultado count]);

	NSManagedObject *recordset;
	
	recordset = [resultado objectAtIndex:1];
	
	
	[labelfetch setText:[recordset valueForKey:@"nome"]];
	
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

@end
