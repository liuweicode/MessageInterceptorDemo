//
//  MyTextField.m
//  MessageInterceptorDemo
//
//  Created by William on 15/9/11.
//  Copyright (c) 2015年 William. All rights reserved.
//

#import "MyTextField.h"
#import "MessageInterceptor.h"

@interface MyTextField()<UITextFieldDelegate>
{
    MessageInterceptor * delegateInterceptor;
}

@end


@implementation MyTextField

- (instancetype)init
{
    
    NSLog(@"MyTextFiel init");
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    NSLog(@"MyTextFiel initWithFrame");
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    NSLog(@"MyTextFiel awakeFromNib");
    [super awakeFromNib];
    [self setup];    
}

-(void)setup
{
    NSLog(@"MyTextFiel setup");
    delegateInterceptor = [[MessageInterceptor alloc] initWithInterceptedProtocol:@protocol(UITextFieldDelegate)];
    [delegateInterceptor setMiddleMan:self];
    [delegateInterceptor setReceiver:self.delegate];
    [super setDelegate:(id)delegateInterceptor];
}

- (void)dealloc
{
    delegateInterceptor = nil;
}

- (id)delegate
{
    return delegateInterceptor.receiver;
}
- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    if(delegateInterceptor) {
        super.delegate = nil;
        delegateInterceptor.receiver = delegate;
        super.delegate = (id)delegateInterceptor;
    }
    else {
        super.delegate = delegate;
    }
}

#pragma - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"MyTextFiel shouldChangeCharactersInRange");
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)])
    {
        return [self.delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"MyTextFiel dtextFieldDidBeginEditing");
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldDidBeginEditing:) ]) {
        [self.delegate textFieldDidBeginEditing:textField];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"MyTextFiel dtextFieldDidEndEditing");
 
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldDidEndEditing:)])
    {
        [self.delegate textFieldDidEndEditing:textField];
    }
}

@end
