//
//  MasterViewController.h
//  treinaweb
//
//  Created by Paulo Brazil Mazzeo on 22/12/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"


@class DetailViewController;

@interface MasterViewController : UITableViewController <ASIHTTPRequestDelegate>



@property (strong, nonatomic) DetailViewController *detailViewController;
@property (nonatomic,readwrite,retain) NSArray *tweets;

-(void)parseDataRequest:(NSData *)responsedata;



@end
