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
    [self.navController setNavigationBarHidden:YES];
    self.window.rootViewController = self.navController;

    return YES;
}

@end
