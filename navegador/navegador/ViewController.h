//
//  ViewController.h
//  navegador
//
//  Created by Paulo Brazil Mazzeo on 28/10/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>
{
	IBOutlet UITextField *endereco;
	IBOutlet UIWebView *navegador;
	IBOutlet UIActivityIndicatorView *carregando;
	
}

- (IBAction)irpara:(id)sender;





@end
