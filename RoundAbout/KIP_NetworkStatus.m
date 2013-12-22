//
//  KIP_NetworkStatus.m
//  SPI_PAC
//
//  Created by Steve Suranie on 10/30/13.
//  Copyright (c) 2013 Steve Suranie. All rights reserved.
//

#import "KIP_NetworkStatus.h"

@implementation KIP_NetworkStatus

+(KIP_NetworkStatus *)sharedNetworkStatus {
    
    static KIP_NetworkStatus* sharedNetworkStatus;
    
    @synchronized(self) {
        
        if (!sharedNetworkStatus)
            
            sharedNetworkStatus = [[KIP_NetworkStatus alloc] init];
        
        return sharedNetworkStatus;
        
    }
    
}

- (id)init {
    
    //init the reachability class
    _reachability = [Reachability reachabilityForInternetConnection];
    
    return self;
}

- (NSDictionary*) checkNetworkConnectivity {
    
    //send the current status back to the viewcontroller
    NetworkStatus remoteHostStatus = [_reachability currentReachabilityStatus];
    
    NSDictionary* dictConnectivty = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"Connectivity Check", @"Action",
                                  [NSString stringWithFormat:@"%i", remoteHostStatus], @"Status",
                                  nil];
    
    return dictConnectivty;
    
}


@end
