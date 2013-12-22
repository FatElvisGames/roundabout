//
//  AppDelegate.h
//  RoundAbout
//
//  Created by Steve Suranie on 12/21/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppViewController.h"

#import "DDLog.h"
#import "DDASLLogger.h"
#import "DDFileLogger.h"
#import "DDTTYLogger.h"

#import "KIP_LogManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    DDFileLogger* fileLogger;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AppViewController* viewController;

- (void) setUpLogging;

@end
