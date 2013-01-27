//
//  Line.h
//  2d
//
//  Created by iN diS on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Line : UIView {
   
}
@property (nonatomic) CGPoint start;
@property (nonatomic) CGPoint end;

- (id)initWithFrame:(CGRect)frame start:(CGPoint)s end:(CGPoint)e;
@end
