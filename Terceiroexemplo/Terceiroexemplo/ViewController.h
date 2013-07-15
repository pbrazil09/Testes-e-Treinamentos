//
//  ViewController.h
//  Terceiroexemplo
//
//  Created by Paulo Brazil Mazzeo on 04/10/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
{
	IBOutlet UITextField *meutexto;
	IBOutlet UILabel *meulabel;
	
}


- (IBAction)textoParaLabel;
//exibe um alerta com o texto digitado
- (IBAction)exibirAlerta;


@end
