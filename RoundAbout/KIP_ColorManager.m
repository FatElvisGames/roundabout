//
//  KIP_ColorManager.m
//  KIP_IntegrationSiteReport_v1
//
//  Created by Steve Suranie on 11/14/12.
//  Copyright (c) 2012 Steve Suranie. All rights reserved.
//

#import "KIP_ColorManager.h"

@implementation KIP_ColorManager

+(KIP_ColorManager *)sharedColorManager {
    
    static KIP_ColorManager* sharedColorManager;
    
    @synchronized(self) {
        
        if (!sharedColorManager)
            
            sharedColorManager = [[KIP_ColorManager alloc] init];
        
        return sharedColorManager;
        
    }
    
}

- (UIColor* ) setColor:(float)red :(float)green :(float)blue {
    
    float newRed = red/255;
    float newGreen = green/255;
    float newBlue = blue/255;
    
    UIColor* colorToReturn = [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1.0];
    
    return colorToReturn;
}


@end
