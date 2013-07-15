//
//  ViewController.h
//  mapa
//
//  Created by Paulo Brazil Mazzeo on 20/12/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>




@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
	
	IBOutlet MKMapView *mapa;
	IBOutlet UITextView *end;
	
}

@property (strong,nonatomic) CLLocationManager *localizacao;
@property (strong,nonatomic) CLGeocoder *geocoder;


- (IBAction)atualizarLocalizacao:(id)sender;


@end
