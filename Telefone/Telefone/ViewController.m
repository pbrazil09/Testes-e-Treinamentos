//
//  ViewController.m
//  Telefone
//
//  Created by Paulo Brazil Mazzeo on 20/12/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)fazerligacao:(id)sender
{
    //cria um alerta informando que será feita uma ligação
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Aviso" message:[NSString stringWithFormat:@"Será feita uma ligação para %@", numerotelefone.text] delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"OK", nil];
    //exibe o alerta
    [alerta show];
    //limpa a variável alerta da memória
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //verificar se foi pressionado Cancelar ou OK
    switch (buttonIndex) {
			//caso cancelar
        case 0:
            //limpa campo de texto
            numerotelefone.text = @"";
            break;
            //se for pressionado OK
        case 1:
        {
            //realiza uma ligação
            //cria uma variável URL com o número de telefone
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", numerotelefone.text]];
            //abre uma url do tipo tel:// que direciona para o telefone
			[[UIApplication sharedApplication] openURL:url];
        }
            break;
        default:
            break;
    }
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

@end
