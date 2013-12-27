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

@interface FEG_RegisterController : UIViewController <UITextFieldDelegate>{
    
    KIP_ColorManager* colorManager;
    KIP_NumberManager* numberManager;
    KIP_StringManager* stringManager;
    
    UITextField* txtUserName;
    
}

@property (nonatomic, strong) UIColor* clrMyColor;
@property (nonatomic, strong) NSString* strUserName;
@property (nonatomic, assign) int HUDLocation;

- (void) addCircles : (UIView*) viewToAdd;

- (void) storeColor : (UIButton*) myButton;

- (UIColor*) getColor : (int) colorIndex;

- (void) validateSubmission : (UIButton*) myButton;

@end
