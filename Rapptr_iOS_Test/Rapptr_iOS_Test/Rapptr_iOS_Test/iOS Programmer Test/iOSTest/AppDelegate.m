//
//  AppDelegate.m
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

#import "AppDelegate.h"
#import "iOSTest-Swift.h"

@interface AppDelegate ()
@property (nonatomic, strong) UINavigationController *navController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    MenuViewController *mainMenuViewController = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    
    self.navController = [[UINavigationController alloc] initWithRootViewController:mainMenuViewController];
    [self.navController setNavigationBarHidden:NO];
    self.window.rootViewController = self.navController;
    
    self.window.tintColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    UINavigationBar.appearance.barTintColor = [UIColor colorWithRed:14.0/255.0 green:92.0/255.0 blue:137.0/255.0 alpha:1.0];

    return YES;
}

@end
