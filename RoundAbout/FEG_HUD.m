//
//  FEG_HUD.m
//  RoundAbout
//
//  Created by Steve Suranie on 12/22/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import "FEG_HUD.h"

@interface FEG_HUD ()

@end

@implementation FEG_HUD

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        self.view.backgroundColor = [UIColor blackColor];
        
        stringManager = [[KIP_StringManager alloc] init];
        arrObjs = [[NSMutableArray alloc] init];
        
        NSString* strHUDTitle = @"RoundAbout Level Tracker";
        CGSize HUDTitleSize = [self getStringSize:strHUDTitle :HUD_BIG_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        UILabel* lblHUDTitle = [[UILabel alloc] initWithFrame:CGRectMake(84.0, 20.0, HUDTitleSize.width, HUDTitleSize.height)];
        lblHUDTitle.font = HUD_BIG_FONT;
        lblHUDTitle.text = strHUDTitle;
        lblHUDTitle.textColor = FEG_RA_ORANGE;
        [self.view addSubview:lblHUDTitle];
        
        //Level
        NSString* strLevelID = @"Level:";
        CGSize levelIDSize = [self getStringSize:strLevelID :HUD_STANDARD_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblLevelID = [[FEG_Label alloc] initWithFrame:CGRectMake(84.0, lblHUDTitle.frame.origin.y + lblHUDTitle.frame.size.height + 10.0, levelIDSize.width, levelIDSize.height)];
        lblLevelID.font = HUD_STANDARD_FONT;
        lblLevelID.text = strLevelID;
        lblLevelID.textColor = FEG_RA_WHITE;
        lblLevelID.labelID = 0;
        lblLevelID.strLabelIDDesc = strLevelID;
        [self.view addSubview:lblLevelID];
        [arrObjs addObject:lblLevelID];
        
        //DISC CONVERTED
        NSString* strDiscConverted = @"Disc Converted:";
        CGSize discConvSize = [self getStringSize:strDiscConverted :HUD_STANDARD_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblDiscConverted = [[FEG_Label alloc] initWithFrame:CGRectMake(84.0, lblLevelID.frame.origin.y + lblLevelID.frame.size.height + 5.0, discConvSize.width, discConvSize.height)];
        lblDiscConverted.font = HUD_STANDARD_FONT;
        lblDiscConverted.text = strDiscConverted;
        lblDiscConverted.textColor = FEG_RA_GREEN;
        lblDiscConverted.labelID = 1;
        lblDiscConverted.strLabelIDDesc = strDiscConverted;
        [self.view addSubview:lblDiscConverted];
        [arrObjs addObject:lblDiscConverted];
        
        //DISC CONVERTED PERCENTAGE
        NSString* strDiscConvPerc = @"Percentage:";
        CGSize discConvPercSize = [self getStringSize:strDiscConvPerc :HUD_STANDARD_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblDiscConvPercentage = [[FEG_Label alloc] initWithFrame:CGRectMake(lblDiscConverted.frame.origin.x + lblDiscConverted.frame.size.width + 70.0, lblDiscConverted.frame.origin.y, discConvPercSize.width, discConvPercSize.height)];
        lblDiscConvPercentage.font = HUD_STANDARD_FONT;
        lblDiscConvPercentage.text = strDiscConvPerc;
        lblDiscConvPercentage.textColor = FEG_RA_GREEN;
        lblDiscConvPercentage.labelID = 2;
        lblDiscConvPercentage.strLabelIDDesc = strDiscConvPerc;
        [self.view addSubview:lblDiscConvPercentage];
        [arrObjs addObject:lblDiscConvPercentage];
        
        //DISC LOST
        NSString* strDiscLost = @"Disc Lost:";
        CGSize discLostSize = [self getStringSize:strDiscLost :HUD_STANDARD_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblDiscLost = [[FEG_Label alloc] initWithFrame:CGRectMake(84.0, lblDiscConverted.frame.origin.y + lblDiscConverted.frame.size.height + 5.0, discLostSize.width, discLostSize.height)];
        lblDiscLost.font = HUD_STANDARD_FONT;
        lblDiscLost.text = strDiscLost;
        lblDiscLost.textColor = FEG_RA_RED;
        lblDiscLost.labelID = 3;
        lblDiscLost.strLabelIDDesc = strDiscLost;
        [self.view addSubview:lblDiscLost];
        [arrObjs addObject:lblDiscLost];
        
        //DISC LOST PERCENTAGE
        NSString* strDiscLostPerc = @"Percentage:";
        CGSize discLostPercSize = [self getStringSize:strDiscLostPerc :HUD_STANDARD_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblDiscLostPercentage = [[FEG_Label alloc] initWithFrame:CGRectMake(lblDiscConvPercentage.frame.origin.x, lblDiscLost.frame.origin.y, discLostPercSize.width, discLostPercSize.height)];
        lblDiscLostPercentage.font = HUD_STANDARD_FONT;
        lblDiscLostPercentage.text = strDiscConvPerc;
        lblDiscLostPercentage.textColor = FEG_RA_RED;
        lblDiscLostPercentage.labelID = 4;
        lblDiscLostPercentage.strLabelIDDesc = strDiscConvPerc;
        [self.view addSubview:lblDiscLostPercentage];
        [arrObjs addObject:lblDiscLostPercentage];
        
        //DISC REMAINING
        NSString* strDiscLeft = @"Disc Remaining:";
        CGSize discLeftSize = [self getStringSize:strDiscLeft :HUD_STANDARD_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblDiscLeft = [[FEG_Label alloc] initWithFrame:CGRectMake(84.0, lblDiscLost.frame.origin.y + lblDiscLost.frame.size.height + 5.0, discLeftSize.width, discLeftSize.height)];
        lblDiscLeft.font = HUD_STANDARD_FONT;
        lblDiscLeft.text = strDiscLeft;
        lblDiscLeft.textColor = FEG_RA_YELLOW;
        lblDiscLeft.labelID = 5;
        lblDiscLeft.strLabelIDDesc = strDiscLeft;
        [self.view addSubview:lblDiscLeft];
        [arrObjs addObject:lblDiscLeft];
        
        //DISC REMAINING PERCENTAGE
        NSString* strDiscLeftPerc = @"Percentage:";
        CGSize discLeftPercSize = [self getStringSize:strDiscLeftPerc :HUD_STANDARD_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblDiscLeftPercentage = [[FEG_Label alloc] initWithFrame:CGRectMake(lblDiscLostPercentage.frame.origin.x, lblDiscLeft.frame.origin.y, discLeftPercSize.width, discLeftPercSize.height)];
        lblDiscLeftPercentage.font = HUD_STANDARD_FONT;
        lblDiscLeftPercentage.text = strDiscLeftPerc;
        lblDiscLeftPercentage.textColor = FEG_RA_YELLOW;
        lblDiscLeftPercentage.labelID = 6;
        lblDiscLeftPercentage.strLabelIDDesc = strDiscLeftPerc;
        [self.view addSubview:lblDiscLeftPercentage];
        [arrObjs addObject:lblDiscLeftPercentage];
        
        //TIME
        NSString* strTime = @"Time:";
        CGSize timeSize = [self getStringSize:strTime :HUD_BIG_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblTime = [[FEG_Label alloc] initWithFrame:CGRectMake(84.0, lblDiscLeft.frame.origin.y + lblDiscLeft.frame.size.height + 20.0, timeSize.width, timeSize.height)];
        lblTime.font = HUD_BIG_FONT;
        lblTime.text = strTime;
        lblTime.textColor = FEG_RA_WHITE;
        lblTime.labelID = 7;
        lblTime.strLabelIDDesc = strTime;
        [self.view addSubview:lblTime];
        [arrObjs addObject:lblTime];
        
        //SCORE
        NSString* strScore = @"Score:";
        CGSize scoreSize = [self getStringSize:strScore :HUD_BIG_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblScore = [[FEG_Label alloc] initWithFrame:CGRectMake(lblTime.frame.origin.x + lblTime.frame.size.width + 70.0, lblDiscLeft.frame.origin.y + lblDiscLeft.frame.size.height + 20.0, scoreSize.width, scoreSize.height)];
        lblScore.font = HUD_BIG_FONT;
        lblScore.text = strScore;
        lblScore.textColor = FEG_RA_WHITE;
        lblScore.labelID = 8;
        lblScore.strLabelIDDesc = strScore;
        [self.view addSubview:lblScore];
        [arrObjs addObject:lblScore];
        
        //PLAYER LABELS
        NSString* strPlayer = @"Player:";
        CGSize playerSize = [self getStringSize:strPlayer :HUD_STANDARD_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblPlayer = [[FEG_Label alloc] initWithFrame:CGRectMake(lblLevelID.frame.origin.x + lblLevelID.frame.size.width + 300.0, lblLevelID.frame.origin.y, playerSize.width, playerSize.height)];
        lblPlayer.font = HUD_STANDARD_FONT;
        lblPlayer.text = strPlayer;
        lblPlayer.textColor = FEG_RA_WHITE;
        lblPlayer.labelID = 9;
        lblPlayer.strLabelIDDesc = strPlayer;
        [self.view addSubview:lblPlayer];
        [arrObjs addObject:lblPlayer];
        
        //PLAYER HIGH SCORE
        NSString* strHighScore = @"High Score:";
        CGSize highScoreSize = [self getStringSize:strHighScore :HUD_STANDARD_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblHighScore = [[FEG_Label alloc] initWithFrame:CGRectMake(lblPlayer.frame.origin.x, lblPlayer.frame.origin.y + lblPlayer.frame.size.height + 10.0, highScoreSize.width, highScoreSize.height)];
        lblHighScore.font = HUD_STANDARD_FONT;
        lblHighScore.text = strHighScore;
        lblHighScore.textColor = FEG_RA_WHITE;
        lblHighScore.labelID = 10;
        lblHighScore.strLabelIDDesc = strHighScore;
        [self.view addSubview:lblHighScore];
        [arrObjs addObject:lblHighScore];
        
        //PLAYER LABELS
        NSString* strHighLevel = @"High Level:";
        CGSize highLevelSize = [self getStringSize:strHighLevel :HUD_STANDARD_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblHighLevel = [[FEG_Label alloc] initWithFrame:CGRectMake(lblHighScore.frame.origin.x, lblHighScore.frame.origin.y + lblHighScore.frame.size.height + 10.0, highLevelSize.width, highLevelSize.height)];
        lblHighLevel.font = HUD_STANDARD_FONT;
        lblHighLevel.text = strHighLevel;
        lblHighLevel.textColor = FEG_RA_WHITE;
        lblHighLevel.labelID = 10;
        lblHighLevel.strLabelIDDesc = strHighLevel;
        [self.view addSubview:lblHighLevel];
        [arrObjs addObject:lblHighLevel];
        
        //PLAYER LABELS
        NSString* strGameCoin = @"GameCoin:";
        CGSize gameCoinSize = [self getStringSize:strGameCoin :HUD_BIG_FONT :CGSizeMake(self.view.frame.size.width, 999.0)];
        
        FEG_Label* lblGameCoin = [[FEG_Label alloc] initWithFrame:CGRectMake(lblHighLevel.frame.origin.x, lblHighLevel.frame.origin.y + lblHighLevel.frame.size.height + 30.0, gameCoinSize.width, gameCoinSize.height)];
        lblGameCoin.font = HUD_BIG_FONT;
        lblGameCoin.text = strGameCoin;
        lblGameCoin.textColor = FEG_RA_WHITE;
        lblGameCoin.labelID = 10;
        lblGameCoin.strLabelIDDesc = strGameCoin;
        [self.view addSubview:lblGameCoin];
        [arrObjs addObject:lblGameCoin];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    
}

#pragma mark - Update Label
- (void) updateLabel:(int)labelID : (NSString*) strToDisplay {
    
    FEG_Label* lblThisLabel = [arrObjs objectAtIndex:kPlayer];
    DDLogVerbose(@"%@", lblThisLabel);
    NSString* strPrefix = lblThisLabel.strLabelIDDesc;
    NSString* strText = [NSString stringWithFormat:@"%@ %@", strPrefix, strToDisplay];
    
    //resize
    CGSize labelSize = [self getStringSize:strText :lblThisLabel.font :CGSizeMake(self.view.frame.size.width, 999.0)];
    
    //resize label
    CGRect labelFrame = lblThisLabel.frame;
    labelFrame.size = labelSize;
    lblThisLabel.frame = labelFrame;
    
    //reset label text
    lblThisLabel.text = strText;
    
}

#pragma mark - Get String Size

- (CGSize) getStringSize : (NSString*) strToSize : (UIFont*) fontToUse : (CGSize) constrainedToSize {
    
    CGRect stringRect = [strToSize boundingRectWithSize:constrainedToSize
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:fontToUse}
                                                context:nil];
    CGSize stringSize = stringRect.size;
    
    return stringSize;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
