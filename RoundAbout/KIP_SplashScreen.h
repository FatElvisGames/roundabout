//
//  OAI_SplashScreen.h
//  OAI_IntegrationSiteReport_v1
//
//  Created by Steve Suranie on 11/14/12.
//  Copyright (c) 2012 Steve Suranie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "KIP_ColorManager.h"
#import "KIP_StringManager.h"
#import "KIP_NumberManager.h"


@interface KIP_SplashScreen : UIView {
    
    UIView* parentView;
    KIP_ColorManager* colorManager;
    KIP_StringManager* stringManager;
    KIP_NumberManager* numberManager;
    
    UIImage* imgLogo;
    UIImageView* ivLogo;
    UILabel* lblAppTitle;
    
    //audio
    AVAudioPlayer* audioPlayer;
    
}

- (void) adjustForRotation : (UIDeviceOrientation*) orientation;

- (void) runSplashScreenAnimation; 

@end
