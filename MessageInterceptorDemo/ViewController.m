//
//  ViewController.m
//  MessageInterceptorDemo
//
//  Created by William on 15/9/11.
//  Copyright (c) 2015年 William. All rights reserved.
//

#import "ViewController.h"
#import "MyTextField.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect = [UIScreen mainScreen].bounds;
    MyTextField *myTextFiled = [[MyTextField alloc] initWithFrame:CGRectMake((rect.size.width - 200) / 2, (rect.size.height - 30) / 2, 200, 30)];
    myTextFiled.borderStyle = UITextBorderStyleLine;
    myTextFiled.delegate = self;
    [self.view addSubview:myTextFiled];
    
}

#pragma - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"ViewController textFieldDidBeginEditing");
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"ViewController textFieldDidEndEditing");
}


@end
