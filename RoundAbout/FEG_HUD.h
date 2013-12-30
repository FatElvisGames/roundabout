//
//  FEG_HUD.h
//  RoundAbout
//
//  Created by Steve Suranie on 12/22/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KIP_StringManager.h"
#import "FEG_Label.h"

#import "FEG_Config.h"
#import "FEG_GameController.h"

typedef enum {
    
    kLevel,
    kDiscConverted,
    kDiscConvertedPercentage,
    kDiscLost,
    kDiscLostPercentage,
    kDiscLeft,
    kDiscLeftPercentage,
    kTime,
    kScore,
    kPlayer,
    
} labelType;


@interface FEG_HUD : UIViewController {
    
    KIP_StringManager* stringManager;
    FEG_GameController* gameControl;
    
    NSMutableArray* arrObjs; 
    
}

@property (nonatomic, strong)  NSString* strUserName;

- (void) updateLabel:(int)labelID : (NSString*) strToDisplay;

@end
