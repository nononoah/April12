//
//  April12AppDelegate.h
//  April12
//
//  Created by Noah Blake on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface April12AppDelegate : UIResponder <UIApplicationDelegate>
{
    View *view;
    UIWindow *_window;
}
@property (strong, nonatomic) UIWindow *window;

@end
