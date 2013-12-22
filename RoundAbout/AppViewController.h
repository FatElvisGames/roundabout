//
//  AppViewController.h
//  RoundAbout
//
//  Created by Steve Suranie on 12/21/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KIP_SplashScreen.h"

@interface AppViewController : UIViewController {
 
    KIP_SplashScreen* vSplashScreen;
    CGRect deviceBounds;
}

@property (nonatomic, retain) UIViewController* currentViewController;

- (void) deviceOrientationDidChange;

- (void) checkUserRegistration;

@end
