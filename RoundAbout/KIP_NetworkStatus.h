//
//  KIP_NetworkStatus.h
//  SPI_PAC
//
//  Created by Steve Suranie on 10/30/13.
//  Copyright (c) 2013 Steve Suranie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface KIP_NetworkStatus : NSObject

@property (nonatomic, strong) Reachability* reachability;

+ (KIP_NetworkStatus *)sharedNetworkStatus;

- (NSDictionary*) checkNetworkConnectivity;

@end
