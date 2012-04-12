//
//  View.m
//  April12
//
//  Created by Noah Blake on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "Card.h"
#import "phew.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        
#define RED(color)	(((color) >> 2*8 & 0xFF) / 255.0)
#define GREEN(color)	(((color) >> 1*8 & 0xFF) / 255.0)
#define BLUE(color)	(((color) >> 0*8 & 0xFF) / 255.0)
        
        unsigned color = 0x7cc8f4;
        self.backgroundColor = [UIColor colorWithRed: RED(color) green: GREEN(color) blue: BLUE(color) alpha: .7];
        
        
        CGRect f = CGRectMake(0, 0, 90, 135);
        card = [[Card alloc] initWithFrame: f];
        [self addSubview: card];
    }
    return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
    	[phew removeFromSuperview];
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
        card.center = point;	        
    }
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	card.center = [[touches anyObject] locationInView: self];
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
    CGRect bounds = card.bounds;
    CGRect pBounds = CGRectMake(card.center.x + 30, 
    					card.center.y - 40, 
                        bounds.size.width * 2, 
                        bounds.size.height * .2);
    phew = [[Phew alloc] initWithFrame: pBounds];
    [self addSubview: phew];
 	
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end
