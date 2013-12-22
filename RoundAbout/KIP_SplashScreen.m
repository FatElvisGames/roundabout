//
//  OAI_SplashScreen.m
//  OAI_IntegrationSiteReport_v1
//
//  Created by Steve Suranie on 11/14/12.
//  Copyright (c) 2012 Steve Suranie. All rights reserved.
//

#import "KIP_SplashScreen.h"
#import "FEG_Config.h"

@implementation KIP_SplashScreen


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //get random color
        
        
        colorManager = [[KIP_ColorManager alloc] init];
        stringManager = [[KIP_StringManager alloc] init];
        numberManager = [[KIP_NumberManager alloc] init];
    
        int colorNum = [numberManager randomValueBetween:0 and:COLOR_WHEEL.count-1];
        UIColor* titleColor = [COLOR_WHEEL objectAtIndex:colorNum];
        
        //set the background to white
        self.backgroundColor = [UIColor whiteColor];
        
        //load the logo
        imgLogo = [UIImage imageNamed:@"feg_logo.png"];
        ivLogo = [[UIImageView alloc] initWithImage:imgLogo];
        [ivLogo setFrame:CGRectMake(512-(imgLogo.size.width/2), 200.0, imgLogo.size.width, imgLogo.size.height)];
        
        
        //add the OMDT title
        NSString* strAppTitle = @"Round About";
        CGSize titleSize = [stringManager getStringSize:CGSizeMake(self.frame.size.width, 999.0) :TITLE_FONT :strAppTitle];
        float labelY = ivLogo.frame.origin.y + 240.0;
        
        lblAppTitle = [[UILabel alloc] initWithFrame:CGRectMake(512-(titleSize.width/2), labelY, titleSize.width, titleSize.height)];
        lblAppTitle.text = strAppTitle;
        lblAppTitle.backgroundColor = [UIColor clearColor];
        lblAppTitle.textColor = titleColor;
        lblAppTitle.font = TITLE_FONT;
        
        
        //add objects to self and parent view
        [self addSubview:ivLogo];
        [self addSubview:lblAppTitle];
        
    }
    return self;
}


- (void) runSplashScreenAnimation {
    
    //fade
    [UIView animateWithDuration:2.5 delay:1.0 options:UIViewAnimationOptionCurveEaseOut 
     
        animations:^{
            self.alpha = 0.0;
        }
     
        completion:^ (BOOL finished) {
            
            NSDictionary* dictUserInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                @"Splash Screen Animation Finished", @"Action",
            nil];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"message" object:self userInfo:dictUserInfo];
            
            [self removeFromSuperview];
        }
     ];
    
    
}

- (void) adjustForRotation : (UIDeviceOrientation*) orientation {
    
    CGRect myFrame = self.frame;
    CGRect logoFrame = ivLogo.frame;
    CGRect titleFrame = lblAppTitle.frame;
    
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
        
        myFrame.size.width = 1024.0;
        myFrame.size.height = 768.0;
        
    } else if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) {
        
        myFrame.size.width = 768.0;
        myFrame.size.height = 1024.0;
        
    }
    
    self.frame = myFrame;
    
   

        
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
