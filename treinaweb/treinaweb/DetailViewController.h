//
//  DetailViewController.h
//  treinaweb
//
//  Created by Paulo Brazil Mazzeo on 22/12/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"



@interface DetailViewController : UIViewController
{
	IBOutlet UIImageView *profileImage;
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *tweetLabel;

}
@property (strong, nonatomic) id detailItem;


@end
