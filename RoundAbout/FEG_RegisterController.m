//
//  FEG_RegisterController.m
//  RoundAbout
//
//  Created by Steve Suranie on 12/22/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import "FEG_RegisterController.h"

@interface FEG_RegisterController ()

@end

@implementation FEG_RegisterController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        colorManager = [[KIP_ColorManager alloc] init];
        numberManager = [[KIP_NumberManager alloc] init];
        stringManager = [[KIP_StringManager alloc] init];
        
        CGRect selfFrame = self.view.frame;
        
        UIView* vWrapper = [[UIView alloc] initWithFrame:selfFrame];
        
        UIView* vLeftCol = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 341.0, 768.0)];
        vLeftCol.backgroundColor = [colorManager setColor:66.0 :66.0 :66.0];
        vLeftCol.clipsToBounds = YES;
        [self addCircles:vLeftCol];
        [vWrapper addSubview:vLeftCol];
        
        UIView* vCenterCol = [[UIView alloc] initWithFrame:CGRectMake(vLeftCol.frame.origin.x + vLeftCol.frame.size.width, 0.0, 341.0, 768.0)];
        [vWrapper addSubview:vCenterCol];
        
        UIView* vRightCol = [[UIView alloc] initWithFrame:CGRectMake(vCenterCol.frame.origin.x + vCenterCol.frame.size.width, 0.0, 341.0, 768.0)];
        vRightCol.backgroundColor = [colorManager setColor:66.0 :66.0 :66.0];
        vRightCol.clipsToBounds = YES;
        [self addCircles:vRightCol];
        [vWrapper addSubview:vRightCol];
        
        [self.view addSubview:vWrapper];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

#pragma mark - Add Cirlces
- (void) addCircles : (UIView*) viewToAdd {
    
    //get a random number
    int numOfCircles = [numberManager randomValueBetween:250 and:500];
    
    
    for(int i=0; i<numOfCircles; i++) {
        
        
        //create the circle
        float circleX = [numberManager randomFloatValueBetween:-20.0 :341.0];
        float circleY = [numberManager randomFloatValueBetween:0.0 :768.0];
        float circleRadius = [numberManager randomFloatValueBetween:30.0 :60.0];
        
        int colorNum = [numberManager randomValueBetween:0 and:COLOR_WHEEL.count-1];
        UIColor* clrCircle = [COLOR_WHEEL objectAtIndex:colorNum];
        
        FEG_Circle* thisCircle =[[FEG_Circle alloc] initWithFrame:CGRectMake(circleX, circleY, circleRadius, circleRadius)];
        [thisCircle setMyCircle:clrCircle :circleRadius];
        
        [viewToAdd addSubview:thisCircle];
                     
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
