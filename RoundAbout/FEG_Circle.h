//
//  FEG_Circle.h
//  roundabout
//
//  Created by Steve Suranie on 11/30/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FEG_Circle : UIView

@property (nonatomic, assign) float radius;
@property (nonatomic, retain) UIColor* clrCircle;
@property (nonatomic, assign) BOOL isUserColor; 

- (void) setMyCircle : (UIColor*) clrCircle : (float) radius;

@end
