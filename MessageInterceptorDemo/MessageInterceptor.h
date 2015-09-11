//
//  MessageInterceptor.h
//  MessageInterceptorDemo
//
//  Created by William on 15/9/11.
//  Copyright (c) 2015年 William. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageInterceptor : NSObject

@property (nonatomic, readonly, copy) NSArray * interceptedProtocols;

@property (nonatomic, weak) id receiver;

@property (nonatomic, weak) id middleMan;

- (instancetype)initWithInterceptedProtocol:(Protocol *)interceptedProtocol;

- (instancetype)initWithInterceptedProtocols:(Protocol *)firstInterceptedProtocol, ... NS_REQUIRES_NIL_TERMINATION;

- (instancetype)initWithArrayOfInterceptedProtocols:(NSArray *)arrayOfInterceptedProtocols;

@end
