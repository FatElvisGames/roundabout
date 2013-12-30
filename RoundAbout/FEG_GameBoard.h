//
//  FEG_GameBoard.h
//  RoundAbout
//
//  Created by Steve Suranie on 12/22/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KIP_ColorManager.h"
#import "KIP_NumberManager.h"

#import "FEG_Circle.h"


@interface FEG_GameBoard : UIViewController {
    
    KIP_ColorManager* colorManager;
    KIP_NumberManager* numberManager;
    
    UIView* vGameBoard;
}

@property (nonatomic, strong) UIColor* clrUserColor;
@property (nonatomic, strong) NSString* strUserName;
@property (nonatomic, assign) int gameLevel;
@property (nonatomic, strong) NSDictionary* dictLevelSettings;

- (void) setUpGameBoard : (int) level;

- (NSDictionary*) getLevelSettings : (int) level;


@end
