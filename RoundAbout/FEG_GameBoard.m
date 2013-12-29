//
//  FEG_GameBoard.m
//  RoundAbout
//
//  Created by Steve Suranie on 12/22/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import "FEG_GameBoard.h"

@interface FEG_GameBoard ()

@end

@implementation FEG_GameBoard

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        colorManager = [[KIP_ColorManager alloc] init];
        numberManager = [[KIP_NumberManager alloc] init];
        
        self.view.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    vGameBoard = [[UIView alloc] initWithFrame:CGRectMake(84.0, 40.0, 600.0, 600.0)];
    vGameBoard.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:vGameBoard];
}

#pragma  mark - Game Setup
- (void) setUpGameBoard : (int) level {
    
 
    self.dictLevelSettings = [self getLevelSettings:level];
    
    //add the circles
    int numberOfUserCircles = 36*[[self.dictLevelSettings objectForKey:@"User Color Percentage"] floatValue];
    
    //get the number of the user circles
    NSMutableArray* arrUserCircleLocations = [[NSMutableArray alloc] init];
    int circlesUsed = 0;
    
    //get the locations of the user circles
    while(circlesUsed < numberOfUserCircles) {
      
        int ranRow = [numberManager randomValueBetween:0 and:5];
        int ranCol = [numberManager randomValueBetween:0 and:5];
        
        NSArray* arrCirclePoint = [[NSArray alloc] initWithObjects:[NSNumber numberWithInteger:ranRow], [NSNumber numberWithInteger:ranCol], nil];
        
        if (![arrUserCircleLocations containsObject:arrCirclePoint]) {
            [arrUserCircleLocations addObject:arrCirclePoint];
            circlesUsed++;
        }
        
    }
    
    //set up init points
    float circleX = 80.0;
    float circleY = 80.0;
    float circleRadius = 40.0;
    
    for(int r=0; r<6; r++) {
        
        UIColor* clrCircle;
        
        //increment y
        if (r>0) {
            circleY = circleY + (circleRadius + 40.0);
        }
        
        for(int c=0; c<6; c++) {
            
            //get a random color number
            do  {
                int colorNumber = [numberManager randomValueBetween:0 and:COLOR_WHEEL.count-1];
                clrCircle = [COLOR_WHEEL objectAtIndex:colorNumber];
            } while([clrCircle isEqual:self.clrUserColor]);
            
            //check the circle point
            for(NSArray* arrPoint in arrUserCircleLocations) {
                
                int rowPoint = [[arrPoint objectAtIndex:0] intValue];
                int colPoint = [[arrPoint objectAtIndex:1] intValue];
                
                //get circle color
                if (rowPoint == r && colPoint == c) {
                    
                    clrCircle = self.clrUserColor;
                }
            }
                        
            //increment x
            if (c>0) {
                circleX = circleX + (circleRadius + 40.0);
            }
            
            //add the circle
            FEG_Circle* thisCircle = [[FEG_Circle alloc] initWithFrame:CGRectMake(circleX, circleY, circleRadius, circleRadius)];
            [thisCircle setMyCircle:clrCircle :circleRadius];
            [vGameBoard addSubview:thisCircle];
            
            
        }
        
        //reset x
        circleX = 80.0;
    }
    
    
}

- (NSDictionary*) getLevelSettings : (int) level {
    
    NSMutableDictionary* dictLevelSettings = [[NSMutableDictionary alloc] init];
    
    float percentage = 0.0;
    float botSpeed = 0.0;
    
    switch (level) {
        case 1:
            percentage = .60;
            botSpeed = 1.0;
            break;
        case 2:
            percentage = .60;
            botSpeed = .9;
            break;
        case 3:
            percentage = .50;
            botSpeed = .9;
            break;
        case 4:
            percentage = .50;
            botSpeed = .8;
            break;
        case 5:
            percentage = .40;
            botSpeed = .8;
            break;
        case 6:
            percentage = .40;
            botSpeed = .7;
            break;
        case 7:
            percentage = .30;
            botSpeed = .7;
            break;
        case 8:
            percentage = .30;
            botSpeed = .6;
            break;
        case 9:
            percentage = .20;
            botSpeed = .6;
            break;
        case 10:
            percentage = .10;
            botSpeed = .5;
            break;
        default:
            percentage = .60;
            botSpeed = 1.0;
            break;
    }
    
    [dictLevelSettings setObject:[NSNumber numberWithFloat:percentage] forKey:@"User Color Percentage"];
    [dictLevelSettings setObject:[NSNumber numberWithFloat:botSpeed] forKey:@"Bot Speed"];
    
    return dictLevelSettings;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
