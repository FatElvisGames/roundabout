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
        
        // Set up the shape of the circle
        CAShapeLayer *circle = [CAShapeLayer layer];
        // Make a circular shape
        circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.radius, self.radius)
                                                 cornerRadius:self.radius].CGPath;
        // Center the shape in self.view
        circle.position = CGPointMake(0,0);
        
        // Configure the apperence of the circle
        circle.fillColor = [UIColor clearColor].CGColor;
        circle.strokeColor = self.clrCircle.CGColor;
        circle.lineWidth = self.radius/3;
        
        [self.layer addSublayer:circle];
        
        // Configure animation
        CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        drawAnimation.duration            = 1.5; // "animate over 10 seconds or so.."
        drawAnimation.repeatCount         = 1.0;  // Animate only once..
        drawAnimation.removedOnCompletion = NO;   // Remain stroked after the animation..
        
        // Animate from no part of the stroke being drawn to the entire stroke being drawn
        drawAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        drawAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
        
        // Experiment with timing to get the appearence to look the way you want
        drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        [CATransaction setCompletionBlock:^{
            
        }];
        
        // Add the animation to the circle
        [circle addAnimation:drawAnimation forKey:@"drawCircleAnimation"];

        
        /*
        CGContextRef contextRef = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(contextRef, 2.0);
        CGContextSetFillColorWithColor(contextRef, self.clrCircle.CGColor);
        CGRect circlePoint = (CGRectMake((self.frame.size.width/2)-(self.radius/2), (self.frame.size.height/2)-(self.radius/2), self.radius, self.radius));
        
        
        CGContextFillEllipseInRect(contextRef, circlePoint);
         */
    }
    
}


@end
