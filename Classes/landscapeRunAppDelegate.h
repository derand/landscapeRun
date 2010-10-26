//
//  landscapeRunAppDelegate.h
//  landscapeRun
//
//  Created by maliy on 9/20/10.
//  Copyright 2010 interMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface landscapeRunAppDelegate : NSObject <UIApplicationDelegate> {
    
	UIWindow *window;
	UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

