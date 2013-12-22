//
//  FEG_Config.h
//  RoundAbout
//
//  Created by Steve Suranie on 12/21/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#ifndef RoundAbout_FEG_Config_h
#define RoundAbout_FEG_Config_h

#define MY_FUNCTION __PRETTY_FUNCTION__
#define MY_CODE_LINE __LINE__
#define LOG_TRACK MY_FUNCTION MY_CODE_LINE

//the iOS of the device
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define STANDARD_FONT [UIFont fontWithName:@"Avenir-Book" size:18.0]
#define TITLE_FONT [UIFont fontWithName:@"moonhouse" size:36.0]
#define SPLASH_FONT [UIFont fontWithName:@"LoungeBait" size:48.0]
#define HUD_FONT [UIFont fontWithName:@"LoungeBait" size:30.0]


#define FEG_RA_RED [UIColor colorWithRed:158/255.0f green:11/255.0f blue:15/255.0f alpha:1.0]
#define FEG_RA_GREEN [UIColor colorWithRed:45/255.0f green:134/255.0f blue:25/255.0f alpha:1.0]
#define FEG_RA_PURPLE [UIColor colorWithRed:82/255.0f green:22/255.0f blue:155/255.0f alpha:1.0]
#define FEG_RA_ORANGE [UIColor colorWithRed:242/255.0f green:104/255.0f blue:11/255.0f alpha:1.0]
#define FEG_RA_YELLOW [UIColor colorWithRed:238/255.0f green:214/255.0f blue:10/255.0f alpha:1.0]
#define FEG_RA_BLUE [UIColor colorWithRed:86/255.0f green:175/255.0f blue:232/255.0f alpha:1.0]
#define FEG_RA_BLACK [UIColor blackColor]
#define FEG_RA_WHITE [UIColor whiteColor]
#define FEG_RA_OLIVE [UIColor colorWithRed:144/255.0f green:164/255.0f blue:116/255.0f alpha:1.0]
#define FEG_RA_BROWN [UIColor colorWithRed:88/255.0f green:63/255.0f blue:23/255.0f alpha:1.0]
#define FEG_RA_SLATE [UIColor colorWithRed:81/255.0f green:83/255.0f blue:99/255.0f alpha:1.0]

#define COLOR_WHEEL [NSArray arrayWithObjects: FEG_RA_RED, FEG_RA_GREEN, FEG_RA_PURPLE, FEG_RA_ORANGE, FEG_RA_YELLOW, FEG_RA_BLUE, FEG_RA_OLIVE, FEG_RA_BROWN, FEG_RA_SLATE, nil]







#endif
