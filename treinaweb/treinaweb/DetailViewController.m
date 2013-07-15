//
//  DetailViewController.m
//  treinaweb
//
//  Created by Paulo Brazil Mazzeo on 22/12/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

- (void)dealloc
{
	[_detailItem release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
	
	
		NSDictionary *tweet = self.detailItem;
        
		NSString *name = [[tweet objectForKey:@"user"] objectForKey:@"name"];
		NSString *text = [tweet objectForKey:@"text"];

		nameLabel.text = name;
		tweetLabel.text = text;

	
		NSString *imageUrl = [[tweet objectForKey:@"user"] objectForKey:@"profile_image_url"];
		NSURL *url = [NSURL URLWithString:imageUrl];
	
		ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	
		[request setDelegate:self];
		[request startSynchronous];
		NSError *error = [request error];
		if (!error) {
			NSData *responseData = [request responseData];
			profileImage.image = [UIImage imageWithData:responseData];
		}
	
	}
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
@end
