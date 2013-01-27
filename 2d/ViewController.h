//
//  ViewController.h
//  2d
//
//  Created by iN diS on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

@interface ViewController : UIViewController {
   Line *line;
   
   CGPoint touche;
   CGPoint start;
   CGPoint end;
    
    BOOL directionTop;
}

@end
