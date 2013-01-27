//
//  ViewController.m
//  2d
//
//  Created by iN diS on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    start = CGPointMake(143.0, 211.0);
    end = CGPointMake(73.0, 331.0);
    
    Line *l = [[Line alloc] initWithFrame:self.view.bounds start:start end:end];
    [self.view addSubview:l];
    [l release];
}

- (void) handleTouche: (UITouch *)t {
    CGPoint p = [t locationInView:self.view];
    touche = p;
    [self drawClosestPath];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self handleTouche:[touches anyObject]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self handleTouche:[touches anyObject]];
}

- (void)drawClosestPath {
    float k;
    float b;
    
    float xDiv = end.x - start.x;
    float yDiv = end.y - start.y;
    
    k = yDiv/xDiv;
    b = (-start.x)*yDiv/xDiv + start.y;
    
    float k1 = 1/-k;
    float b1 = touche.y + touche.x/k;
    
    CGPoint newEnd = CGPointMake((b1-b)/(k-k1), (b1*k-k1*b)/(k-k1));
    
    BOOL contains = [self isPointOnLine:newEnd];
    
    if (!contains){
        if (directionTop) {
            newEnd = start;
        } else {
            newEnd = end;
        }
    }
    
    if (!line){
        line = [[Line alloc] initWithFrame:self.view.bounds start:touche end:newEnd];
        [self.view addSubview:line];
    } else {
        line.start = touche;
        line.end = newEnd;
        [line setNeedsDisplay];
    }
}

- (BOOL)isPointOnLine:(CGPoint)point {
    float p = (point.x-end.x)/(start.x - end.x);
    BOOL ok = p / start.y + (1-p)*end.y - point.y <= 0.3;
    directionTop = p>0;
    return ok && p >= 0 && p <= 1;
}

@end
