//
//  AppViewController.h
//  RoundAbout
//
//  Created by Steve Suranie on 12/21/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KIP_SplashScreen.h"

#import "FEG_RegisterController.h"
#import "FEG_HUD.h"
#import "FEG_GameBoard.h"


@interface AppViewController : UIViewController {
 
    KIP_SplashScreen* vSplashScreen;
    CGRect deviceBounds;
    
    FEG_RegisterController* vcRegister;
}

@property (nonatomic, retain) UIViewController* currentViewController;

- (void) deviceOrientationDidChange;

- (void) checkUserRegistration;

@end
