//
//  ViewController.m
//  TransformEx01
//
//  Created by yg on 14. 1. 9..
//  Copyright (c) 2014년 yg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

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
- (IBAction)rotate:(id)sender {
    [UIView beginAnimations:@"id_rotate" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    
    [UIView commitAnimations];
}
- (IBAction)combination:(id)sender {
    
    CGAffineTransform t1 = CGAffineTransformMakeScale(1.2, 1.2);
    CGAffineTransform t2 = CGAffineTransformMakeTranslation(30, 30);
    CGAffineTransform comb = CGAffineTransformConcat(t1, t2);
    
    CGAffineTransform t = CGAffineTransformConcat(self.imageView.transform, comb);
    
    [UIView beginAnimations:@"id_move" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = t;
    
    [UIView commitAnimations];
    
}
- (IBAction)setOriginal:(id)sender {
    [UIView beginAnimations:@"original" context:nil];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
    
    
}
- (IBAction)series:(id)sender {
    [UIView beginAnimations:@"series1" context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(changeBackgroundClear)];
	self.imageView.backgroundColor = [UIColor whiteColor];
	[UIView commitAnimations];
}

- (void)changeBackgroundClear {
	[UIView beginAnimations:@"series2" context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	self.imageView.backgroundColor = [UIColor clearColor];
	[UIView commitAnimations];
}

@end
































