//
//  FEG_RegisterController.h
//  RoundAbout
//
//  Created by Steve Suranie on 12/22/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "KIP_ColorManager.h"
#import "KIP_NumberManager.h"
#import "KIP_StringManager.h"

#import "FEG_Circle.h"

@interface FEG_RegisterController : UIViewController {
    
    KIP_ColorManager* colorManager;
    KIP_NumberManager* numberManager;
    KIP_StringManager* stringManager;
    
}

- (void) addCircles : (UIView*) viewToAdd;

@end
