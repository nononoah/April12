//
//  View.m
//  April5
//
//  Created by Noah Blake on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)initWithFrame:(CGRect)frame
{
	
    self = [super initWithFrame:frame];
    if (self) {
    	self.backgroundColor = [UIColor colorWithRed: .03 green:.5 blue:.5 alpha: 0];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGRect bounds = self.bounds;
    CGFloat radius = .2 * bounds.size.width;
    NSLog(@"width is %g", bounds.size.width);
    NSLog(@"height is %g", bounds.size.height);
    
    /*
    UIFont *font = [UIFont systemFontOfSize: 21.0];
   // NSString *string = NSLocalizedString(@"genusSpecies", @"displayed with drawAtPoint:");
   	NSString *string = @"cardinalis cardinalis";
    CGPoint point = CGPointMake(-radius, radius);
    [string drawAtPoint: point withFont: font];
    
    //NSString *string2 = NSLocalizedString(@"commonName", @"displayed with drawAtPoint:");
	NSString *string2 = @"northern cardinal";
    CGPoint point2 = CGPointMake(-radius + 5, radius + 21);
    [string2 drawAtPoint: point2 withFont: font];
    */
    
    int midX = (bounds.size.width / 2) - radius;
    int midY = -(bounds.size.height / 2) - radius;
    
    CGRect r = CGRectMake(
                          midX,
                          midY,
                          2 * radius,
                          3 * radius
                          );
    
    
    
   	//begin drawing
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    //reverse y-axis
    CGContextScaleCTM(c, 1, -1);
    
    //bird body
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, r);
    CGContextSetRGBFillColor(c, 1.0, .2, .2, 1);
    CGContextFillPath(c);
    
    //eyestripe
    CGContextAddEllipseInRect(c, CGRectMake(midX * 5/3, midY * 3/5, radius * 8/9, radius/2));
    CGContextSetCMYKFillColor(c, 0, 0, 0, 1, 1);
    CGContextFillPath(c);
    
    //upper mandible + lower mandible + nares
    CGContextBeginPath(c);
    
    //set point near edge of elipse, define edges of mandible
    CGFloat mandibleEdge = radius / 4;
    CGFloat xStart = midX * 2.3;
    CGFloat yStart = midY * .535;
    
    //nares
    CGContextMoveToPoint(c, xStart, yStart);
    CGContextAddLineToPoint(c, xStart, yStart + mandibleEdge); //top right
    CGContextAddLineToPoint(c, xStart - mandibleEdge, yStart); //eyestripe connected
    CGContextAddLineToPoint(c, xStart, yStart - mandibleEdge); //top left
    CGContextClosePath(c);
    
    CGContextSetCMYKFillColor(c, 0, 0, 0, 1, 1);
    CGContextFillPath(c);
    
    //mandibles
    CGContextMoveToPoint(c, xStart, yStart);
    CGContextAddLineToPoint(c, xStart, yStart - mandibleEdge); //bottom left
    CGContextAddLineToPoint(c, xStart + 2 * mandibleEdge, yStart); //tip
    CGContextAddLineToPoint(c, xStart, yStart + mandibleEdge); //top left
    CGContextClosePath(c);
    
    
    CGContextSetCMYKFillColor(c, 0, .49, 1, 0, 1);
    CGContextFillPath(c);
    
    
    //divide the mandibles
    CGContextMoveToPoint(c, xStart, yStart - mandibleEdge/4);
    CGContextAddLineToPoint(c, xStart + mandibleEdge * 7/5, yStart - mandibleEdge/4);
    CGContextClosePath(c);
    CGContextSetCMYKStrokeColor(c, 0, 0, 0, 1, 1);
    CGContextStrokePath(c);
    
    
    //eye
    CGContextAddEllipseInRect(c, CGRectMake(midX * 1.85, midY * .56, radius/5, radius/5));
    CGContextSetCMYKFillColor(c, .66, .15, 0, 0, 1);
    CGContextFillPath(c);
    
    //wingstripe
    CGContextAddArc(c, midX * 1.2, midY * .7, radius, 0, 3 * 3.14 / 2 , 1);
    CGContextSetCMYKStrokeColor(c, 0, 0, 0, 1, 1);
    CGContextStrokePath(c);
    
    //crest
    CGContextAddArc(c, midX * 1.6, midY * .48, radius * 2/3, 0, 3 * 3.14 / 4, 0);
    CGContextSetRGBFillColor(c, 1.0, .2, .2, 1);
    CGContextFillPath(c);
}


@end
