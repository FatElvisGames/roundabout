//
//  FEG_GameController.m
//  RoundAbout
//
//  Created by Steve Suranie on 12/29/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import "FEG_GameController.h"

@implementation FEG_GameController

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage* imgLeftRightNav = [UIImage imageNamed:@"img_leftright.png"];
        UIButton* btnLeftRightNav = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnLeftRightNav setImage:imgLeftRightNav forState:UIControlStateNormal];
        [btnLeftRightNav setFrame:CGRectMake(20.0, 20.0, imgLeftRightNav.size.width, imgLeftRightNav.size.height)];
        [btnLeftRightNav addTarget:self action:@selector(moveController:) forControlEvents:UIControlEventTouchUpInside];
        btnLeftRightNav.tag = 100;
        
        [self addSubview:btnLeftRightNav];
                                             
    }
    return self;
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
