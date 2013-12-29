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
        
        
        UIView* vBackground = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 768.0, 1024.0)];
        vBackground.backgroundColor = [UIColor whiteColor];
        vBackground.clipsToBounds = YES;
        [self addCircles:vBackground];
        [vWrapper addSubview:vBackground];
        
        UIView* vCenterCol = [[UIView alloc] initWithFrame:CGRectMake(184.0, 0.0, 400.0, 1024.0)];
        vCenterCol.backgroundColor = [UIColor whiteColor];
        vCenterCol.layer.shadowColor = [UIColor blackColor].CGColor;
        vCenterCol.layer.shadowOffset = CGSizeMake(2.0, 5.0);
        vCenterCol.layer.shadowOpacity = .9;
        
        
        NSString* strWelcome = @"Welcome To RoundAbout";
        CGSize welcomeSize = [stringManager getStringSize:CGSizeMake(vCenterCol.frame.size.width, 999.0) :WELCOME_FONT :strWelcome];
        UILabel* lblWelcome = [[UILabel alloc] initWithFrame:CGRectMake((vCenterCol.frame.size.width/2)-(welcomeSize.width/2), 200.0, welcomeSize.width, welcomeSize.height)];
        lblWelcome.font = WELCOME_FONT;
        lblWelcome.text = strWelcome;
        lblWelcome.textColor = FEG_RA_BLACK;
        lblWelcome.numberOfLines = 0;
        lblWelcome.lineBreakMode = NSLineBreakByWordWrapping;
        [vCenterCol addSubview:lblWelcome];
        
        
        NSString* strInstructions = @"Since this is your first time playing the game we need to do a few quick set ups. Enter a user name in the text field below and select your 'team color' by tapping one of the color boxes. You can always change these setting later by clicking on the account icon in the game.\n\nAnd you can always check your game coin, personal best and other stats by coming back here.";
        CGSize instructionsSize = [stringManager getStringSize:CGSizeMake(vCenterCol.frame.size.width-20.0, 999.0) :INSTRUCTIONS_FONT :strInstructions];
        
        UILabel* lblInstructions = [[UILabel alloc] initWithFrame:CGRectMake(10.0, lblWelcome.frame.origin.y + lblWelcome.frame.size.height + 10.0, instructionsSize.width, instructionsSize.height)];
        lblInstructions.font = INSTRUCTIONS_FONT;
        lblInstructions.text = strInstructions;
        lblInstructions.textColor = FEG_RA_BLACK;
        lblInstructions.numberOfLines = 0;
        lblInstructions.lineBreakMode = NSLineBreakByWordWrapping;
        [vCenterCol addSubview:lblInstructions];
        
        txtUserName = [[UITextField alloc] initWithFrame:CGRectMake((vCenterCol.frame.size.width/2)-100.0, lblInstructions.frame.origin.y + lblInstructions.frame.size.height + 20.0, 200.0, 30.0)];
        txtUserName.placeholder = @"User Name";
        txtUserName.font = STANDARD_FONT;
        txtUserName.delegate = self;
        txtUserName.backgroundColor = [UIColor whiteColor];
        txtUserName.borderStyle = UITextBorderStyleRoundedRect;
        [vCenterCol addSubview:txtUserName];
        
        
        UIView* vColorRow = [[UIView alloc] initWithFrame:CGRectMake(20.0, txtUserName.frame.origin.y + txtUserName.frame.size.height + 20.0, vCenterCol.frame.size.width-10.0, 40.0)];
        
        float btnX = 0.0;
        
        for(int i=0; i<9; i++) {
            
            UIColor* clrToUse = [self getColor:i];
            
            UIButton* btnThisColor = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnThisColor setFrame:CGRectMake(btnX, 0.0, 30.0, 30.0)];
            [btnThisColor setBackgroundColor:clrToUse];
            [btnThisColor addTarget:self action:@selector(storeColor:) forControlEvents:UIControlEventTouchUpInside];
            btnThisColor.tag = i;
            [vColorRow addSubview:btnThisColor];
            
            btnX = btnX + 40.0;
        }
        [vCenterCol addSubview:vColorRow];
        
        NSString* strButtonTitle = @"Submit";
        CGSize buttonTitleSize = [stringManager getStringSize:CGSizeMake(vCenterCol.frame.size.width, 999.0) :STANDARD_FONT :strButtonTitle];
        
        UIButton* btnSubmit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btnSubmit setBackgroundColor:[UIColor whiteColor]];
        [btnSubmit setFrame:CGRectMake((vCenterCol.frame.size.width/2)-75.0, vColorRow.frame.origin.y + vColorRow.frame.size.height + 10.0, 150.0, buttonTitleSize.height)];
        [btnSubmit setTitle:strButtonTitle forState:UIControlStateNormal];
        [btnSubmit addTarget:self action:@selector(validateSubmission:) forControlEvents:UIControlEventTouchUpInside];
        [vCenterCol addSubview:btnSubmit];
        
        
        
        [vWrapper addSubview:vCenterCol];
        
        
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
    int numOfCircles = [numberManager randomValueBetween:500 and:750];
    
    
    for(int i=0; i<numOfCircles; i++) {
        
        
        //create the circle
        float circleX = [numberManager randomFloatValueBetween:-20.0 :768.0];
        float circleY = [numberManager randomFloatValueBetween:0.0 :1024.0];
        float circleRadius = [numberManager randomFloatValueBetween:30.0 :60.0];
        
        int colorNum = [numberManager randomValueBetween:0 and:COLOR_WHEEL.count-1];
        UIColor* clrCircle = [COLOR_WHEEL objectAtIndex:colorNum];
        
        FEG_Circle* thisCircle =[[FEG_Circle alloc] initWithFrame:CGRectMake(circleX, circleY, circleRadius, circleRadius)];
        [thisCircle setMyCircle:clrCircle :circleRadius];
        
        [viewToAdd addSubview:thisCircle];
                     
        
    }
    
}

#pragma mark - Get Colors

- (UIColor*) getColor : (int) colorIndex {

    UIColor* clrToUse;
    
    switch (colorIndex) {
        case 0:
            clrToUse = FEG_RA_BLUE;
            break;
            
        case 1:
            clrToUse = FEG_RA_BROWN;
            break;
            
        case 2:
            clrToUse = FEG_RA_GREEN;
            break;
            
        case 3:
            clrToUse = FEG_RA_OLIVE;
            break;
            
        case 4:
            clrToUse = FEG_RA_ORANGE;
            break;
            
        case 5:
            clrToUse = FEG_RA_PURPLE;
            break;
            
        case 6:
            clrToUse = FEG_RA_RED;
            break;
            
        case 7:
            clrToUse = FEG_RA_SLATE;
            break;
            
        case 8:
            clrToUse = FEG_RA_YELLOW;
            break;
            
        default:
            clrToUse = FEG_RA_WHITE;
            break;
    }
    
    return clrToUse;

}


#pragma mark - Store User Selected Color
- (void) storeColor : (UIButton*) myButton {
    
    //set color
    int thisColorIndex = myButton.tag;
    self.clrMyColor = [self getColor:thisColorIndex];
}

#pragma mark - Validate

- (void) validateSubmission : (UIButton*) myButton {
    
    BOOL isValid = YES;
    NSMutableString* strErrMsg = [[NSMutableString alloc] initWithString:@"There was an error with your submission. Please correct the following:\n\n"];
    
    //check the color selection
    if (!self.clrMyColor) {
        isValid = NO;
        [strErrMsg appendString:@"You did not select a team color.\n\n"];
    }
    
    //check the user name
    if (txtUserName.text.length == 0) {
        isValid = NO;
        [strErrMsg appendString:@"You did not enter a user name.\n\n"];
    } else {
        self.strUserName = txtUserName.text;
    }
    
    //show alert if not valid
    if (!isValid) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Submission Error!" message:strErrMsg delegate:Nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [alert show];
    
    } else {
        
        //convert uicolor to data
        NSData* colorData = [NSKeyedArchiver archivedDataWithRootObject:self.clrMyColor];
        
        //store selections in userdefaults
        NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:colorData forKey:@"User Color"];
        [userDefaults setObject:self.strUserName forKey:@"User Name"];
        
        //send notice back to appcontroller
        NSDictionary* dictUserInfo = [[NSDictionary alloc] initWithObjectsAndKeys:@"Show Game", @"Action", nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"message" object:self userInfo:dictUserInfo];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
