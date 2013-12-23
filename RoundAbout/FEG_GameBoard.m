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
        
        self.view.backgroundColor = [colorManager setColor:66.0 :66.0 :66.0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
