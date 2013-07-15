//
//  ViewController.m
//  mapa
//
//  Created by Paulo Brazil Mazzeo on 20/12/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

@synthesize localizacao = _localizacao;
@synthesize geocoder = _geocoder;




- (IBAction)atualizarLocalizacao:(id)sender {
	
    //aloca e inicia a variavel localizacao
    _localizacao = [[CLLocationManager alloc] init];
    //informa a variavel que está classe é seu proprio delegate
    [_localizacao setDelegate:self];
    //inicia tracker da localizacao do usuário
    [_localizacao startUpdatingLocation];

	

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


- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
	
    NSLog(@"Latitude %f - Longitude %f", newLocation.coordinate.latitude , newLocation.coordinate.longitude);
	
    // Criar o zoom para a região
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    // Criar a região com a localização recebida e o zoom criado acima
    MKCoordinateRegion region = MKCoordinateRegionMake(newLocation.coordinate, span);
    // Mudar a região do mapa com animação
    [mapa setRegion:region animated:YES];
    //adiciona um ponto azul na localização do usuário
    [mapa setShowsUserLocation:YES];
	

	
	CLGeocoder *geocoder = [[CLGeocoder alloc] init];
	
	[geocoder reverseGeocodeLocation:newLocation
				   completionHandler:^(NSArray *placemarks, NSError *error) {
					   
					   if (error) {
						   NSLog(@"Geocode failed with error: %@", error);
						   return;
					   }
					   
					   if (placemarks && placemarks.count > 0)
					   {
						   CLPlacemark *placemark = placemarks[0];
						   
						   NSDictionary *addressDictionary =
						   placemark.addressDictionary;
						   
						   NSLog(@"%@ ", addressDictionary);

						   NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
						   
						   [end setText:locatedAt];
							
						   NSLog(@"%@",locatedAt);
							
					   }
					   
				   }];
	[_localizacao stopUpdatingLocation];
	
	
	
//	[self.localizacao stopUpdatingLocation];
	
	
}







@end
