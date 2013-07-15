//
//  ViewController.m
//  exemplotable
//
//  Created by Paulo Brazil Mazzeo on 06/10/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    //retorna o número de itens no array
    return [nomes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Cria a variável cell, mas não a inicia
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //verifica se a célula foi iniciada
    if (cell == nil) {
		//se a célula não foi iniciada aloca e a inicia
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"] autorelease];
    }
    
    //adiciona o nome na célula de acordo com a ordem no array e de acordo com o índice da célula
    cell.textLabel.text = [nomes objectAtIndex:indexPath.row];
    
    //retorna à célula montada
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cria um objeto do tipo alerta e o inicia
    UIAlertView *alerta = [[UIAlertView alloc] init];
    //define o título do alerta
    [alerta setTitle:@"Alerta"];
    //seta o texto da mensagem de acordo com o nome selecionado
    [alerta setMessage:[NSString stringWithFormat:@"Voce selecionou %@", [nomes objectAtIndex:indexPath.row]]];
    //adiciona um botão OK
    [alerta addButtonWithTitle:@"OK"];
    //exibe o alerta
    [alerta show];
    //limpa o alerta da memória
    [alerta release];
}



- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	UIAlertView *alertateste = [[UIAlertView alloc] init];
	[alertateste setTitle:@"TESTE DA BAGAÇA"];
	[alertateste setMessage:[nomes objectAtIndex:indexPath.row]];
	[alertateste addButtonWithTitle:@"OK"];
	[alertateste show];
	[alertateste release];
	
	
}




- (void)viewDidLoad
{
	
    //alocando e iniciando o array nomes
    nomes = [[NSMutableArray alloc] init];
    //adicionando nomes ao array
    [nomes addObject:@"Fernando"];
    [nomes addObject:@"João"];
    [nomes addObject:@"Maria"];
    [nomes addObject:@"Steve"];
    [nomes addObject:@"Bill"];
    [nomes addObject:@"Paulo"];
    [nomes addObject:@"Jonas"];
    [nomes addObject:@"Ronaldo"];
    [nomes addObject:@"Adriano"];
    [nomes addObject:@"Tatiane"];
	
	
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
