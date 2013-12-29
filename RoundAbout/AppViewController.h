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
    
    NSUserDefaults* userDefaults; 
    
    FEG_RegisterController* vcRegister;
    FEG_HUD* vcHUD;
    FEG_GameBoard* vcGameBoard; 
}

@property (nonatomic, retain) UIViewController* currentViewController;
@property (nonatomic, strong) UIColor* clrUserColor;
@property (nonatomic, strong) NSString* strUserName;
@property (nonatomic, assign) int HUDLocation;

- (void) checkUserRegistration;

- (void) showGameBoard;



@end
