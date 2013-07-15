//
//  ViewController.m
//  Quartoprojeto
//
//  Created by Paulo Brazil Mazzeo on 06/10/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "ViewController.h"
#import "SegundaView.h"


@interface ViewController ()

@end

@implementation ViewController

-(IBAction)mostraroutraview
{
	
    SegundaView *view2 = [[SegundaView alloc] init];
	
	[view2 setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    //Exibe a segunda view com a animação padrão para o modal
//    [self presentModalViewController:view2 animated:YES];
	[self presentViewController:view2 animated:YES completion:NULL];
	
	
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
