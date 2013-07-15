//
//  ViewController.m
//  Terceiroexemplo
//
//  Created by Paulo Brazil Mazzeo on 04/10/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (IBAction)textoParaLabel
{
    [meulabel setText:[meutexto text]];
}

//exibe um alerta com o texto digitado
- (IBAction)exibirAlerta
{
    //cria um objeto do tipo alerta e o inicia
    UIAlertView *alerta = [[UIAlertView alloc] init];
    //define o título do alerta
    [alerta setTitle:@"Alerta"];
    //seta o texto da mensagem de acordo com o campo de texto
    [alerta setMessage:meutexto.text];
    //adiciona um botão OK
    [alerta addButtonWithTitle:@"Ok"];
//    [alerta addButtonWithTitle:@"No"];
	
    //exibe o alerta
    [alerta show];
    //limpa o alerta da memória
    [alerta release];
	
	
	NSString *testestr;
	testestr = meutexto.text;
	
	
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
	//retorna YES para dizer que a ação deve ser executada
    return YES;
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
