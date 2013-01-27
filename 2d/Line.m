//
//  Line.m
//  2d
//
//  Created by iN diS on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Line.h"

@implementation Line

@synthesize start,end;

- (id)initWithFrame:(CGRect)frame start:(CGPoint)s end:(CGPoint)e
{
    self = [super initWithFrame:frame];
    if (self) {
       self.backgroundColor = [UIColor clearColor];
       self.start = s;
       self.end = e;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
   CGContextRef c = UIGraphicsGetCurrentContext();
   
   CGFloat red[4] = {1.0f, 0.0f, 0.0f, 1.0f};
   CGContextSetStrokeColor(c, red);
   CGContextBeginPath(c);
   CGContextMoveToPoint(c, start.x, start.y);
   CGContextAddLineToPoint(c, end.x, end.y);
   CGContextStrokePath(c);
}

@end
