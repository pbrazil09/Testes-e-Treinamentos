//
//  ViewController.m
//  ScrollView1
//
//  Created by Paulo Brazil Mazzeo on 20/10/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //retorna a view da imagem para ser ampliada
    return imageview;
}





- (void)viewDidLoad
{
	
	
	int i;
	int x=0;
	
	
	for(i=1;i<6;i++)
	{
		imageview = [[UIImageView alloc] init];
		NSString *nomeDaImagem = [NSString stringWithFormat:@"%d.jpg", i];
		[imageview setImage:[UIImage imageNamed:nomeDaImagem]];
		[imageview setFrame:CGRectMake(x,0,320,480)];
		x=x+320;
		[scroll1 addSubview:imageview];
		
		[imageview release];
		
//		NSLog(nomeDaImagem);

		
	}
	

	[scroll1 setMinimumZoomScale:1];
	[scroll1 setMaximumZoomScale:4];
	[scroll1 setContentSize:CGSizeMake(320 * 5, 480)];	
	
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
