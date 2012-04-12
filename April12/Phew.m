//
//  Phew.m
//  April12
//
//  Created by Noah Blake on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Phew.h"

@implementation Phew


- (id) initWithFrame: (CGRect)frame
{
self = [super initWithFrame: frame];
if (self) {
    // Initialization code
    self.backgroundColor = [UIColor colorWithRed: .03 green:.5 blue:.5 alpha: 0];
}
return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
    // Drawing code
    UIFont *font = [UIFont systemFontOfSize: 20];
    [@"phew!" drawAtPoint: CGPointZero withFont: font];
}


@end
