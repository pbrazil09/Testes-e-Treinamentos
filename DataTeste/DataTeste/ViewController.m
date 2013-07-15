//
//  ViewController.m
//  DataTeste
//
//  Created by SKY BRASIL SERVICOS LTDA on 4/4/13.
//  Copyright (c) 2013 SKY BRASIL SERVICOS LTDA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (NSString *)timeFormatted:(int)totalSeconds {
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    ////////////////////////////////////////////////////////////////
    // Yesterday
    ////////////////////////////////////////////////////////////////
//    NSDateFormatter * dateFormatter = [NSDateFormatter new];
//    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    
//    NSString * strYesterday = @"2013-04-13 13:05:01";
//    NSDate * yesterday = [dateFormatter dateFromString:strYesterday];
//    
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:yesterday];
//    [components setTimeZone:[NSTimeZone systemTimeZone]];
//    
//    NSInteger hour = [components hour];
//    NSInteger minute = [components minute];
//    NSInteger second = [components second];
//    
//    NSLog(@"%i : %i : %i", hour, minute, second);
    
    
    ////////////////////////////////////////////////////////////////
    // Today
    ////////////////////////////////////////////////////////////////
    
    NSDateFormatter * dateFormatter2 = [NSDateFormatter new];
    //[dateFormatter2 setFormatterBehavior:NSDateFormatterBehavior10_4];
    //[dateFormatter2 setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter2 setDateFormat:@"dd/MM/yyyy HH:mm:ss Z"];
    
    NSLog(@"%@",[NSTimeZone systemTimeZone]);
    
    NSString * strToday = @"30/04/2013 10:09:56 +0000";
    NSDate * today = [dateFormatter2 dateFromString:strToday];
    
    //[dateFormatter2 setDefaultDate:today];
    
    //NSDate * dtaToday = dateFormatter2.defaultDate;
    //NSLog(@"T: %@", dtaToday);
    NSLog(@"T: %@", today);
    
    
    NSString *dateStr = @"2012-05-03 06:03:00 +0000";
    NSDateFormatter *datFormatter = [[NSDateFormatter alloc] init];
    [datFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZZ"];
    NSDate* date = [datFormatter dateFromString:dateStr];
    NSLog(@"date: %@", [datFormatter stringFromDate:date]);
    //NSLog(@"%i",(([[NSTimeZone localTimeZone] secondsFromGMT]/60)/60));
    //NSLog(@"%i",[[NSTimeZone localTimeZone] secondsFromGMT]);

    //
    // Differences
    //
    //NSTimeInterval seconds = [today timeIntervalSinceDate:yesterday];
    //NSLog(@"D: %@", [self timeFormatted:seconds]);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
