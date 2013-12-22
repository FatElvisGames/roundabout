//
//  KIP_LogManager.h
//  SPI_PAC
//
//  Created by Steve Suranie on 10/29/13.
//  Copyright (c) 2013 Steve Suranie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KIP_LogManager : NSObject <DDLogFormatter>

+ (KIP_LogManager *)sharedLogManager;

- (NSString*)formatLogMessage:(DDLogMessage* )strMsg;

@end
