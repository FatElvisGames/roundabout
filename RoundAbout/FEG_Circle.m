//
//  FEG_Circle.m
//  roundabout
//
//  Created by Steve Suranie on 11/30/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import "FEG_Circle.h"

@implementation FEG_Circle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) setMyCircle : (UIColor*) clrCircle : (float) radius {
    
    self.clrCircle = clrCircle;
    self.radius = radius;
    
    [self setNeedsDisplay];
    
}


- (void)drawRect:(CGRect)rect {
    
    if(self.clrCircle) {
        
        
        CGContextRef contextRef = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(contextRef, 2.0);
        CGContextSetFillColorWithColor(contextRef, self.clrCircle.CGColor);
        CGRect circlePoint = (CGRectMake((self.frame.size.width/2)-(self.radius/2), (self.frame.size.height/2)-(self.radius/2), self.radius, self.radius));
        
        
        CGContextFillEllipseInRect(contextRef, circlePoint);
    }
    
}


@end
