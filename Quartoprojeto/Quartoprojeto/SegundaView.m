//
//  SegundaView.m
//  Quartoprojeto
//
//  Created by Paulo Brazil Mazzeo on 06/10/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "SegundaView.h"

@interface SegundaView ()

@end

@implementation SegundaView



- (IBAction)fecharview
{
    //chamada para fechar a view
    [self dismissViewControllerAnimated:YES completion:NULL];
}





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
