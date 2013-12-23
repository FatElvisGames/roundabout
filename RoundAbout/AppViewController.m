//
//  AppViewController.m
//  RoundAbout
//
//  Created by Steve Suranie on 12/21/13.
//  Copyright (c) 2013 Fat Elvis Games. All rights reserved.
//

#import "AppViewController.h"

@interface AppViewController ()

@end

@implementation AppViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        self.view.backgroundColor = [UIColor whiteColor];
        vSplashScreen = [[KIP_SplashScreen alloc] init];
        
        deviceBounds = self.view.bounds;
        
        vcRegister = [[FEG_RegisterController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"message"object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    vSplashScreen = [[KIP_SplashScreen alloc] initWithFrame:CGRectMake(deviceBounds.origin.x, deviceBounds.origin.y, deviceBounds.size.width, deviceBounds.size.height)];
    [self.view addSubview:vSplashScreen];
    [vSplashScreen runSplashScreenAnimation];
	
    
}

#pragma mark - Notification Center
- (void) receiveNotification:(NSNotification* ) notification {
    
    if ([[notification name] isEqualToString:@"message"]) {
        
        DDLogVerbose(@"%@ |%@ \n%@", [notification name], [[notification userInfo] objectForKey:@"Action"], [notification userInfo]);
        
        NSString* strAction = [[notification userInfo] objectForKey:@"Action"];
        
        if ([strAction isEqualToString:@"Splash Screen Animation Finished"]) {
            
            [self checkUserRegistration];
        }
        
    }
    
}

- (void) checkUserRegistration {
    
    //get the standard defaults
    NSUserDefaults* appDefaults = [NSUserDefaults standardUserDefaults];
    
    //check to see if player has set up a color yet
    if ([appDefaults objectForKey:@"Player Color"] == nil) {
        
        //launch register screen if not
        [self presentChildViewController:vcRegister];
        
        
    } else {
        
        
        //launch game screen
    }
}

#pragma mark - Device Orientation Methods
- (void) deviceOrientationDidChange {
    
    //get the current orientation
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    //rotate splash screen
    if (vSplashScreen) {
        [vSplashScreen adjustForRotation:&orientation];
    }
    
    
}

#pragma mark - Container View Controllers

- (void) presentChildViewController : (UIViewController*) vcChild {
    
    //add the child view controller
    [self addChildViewController:vcChild];
    
    [vcChild.view setFrame:CGRectMake(1025.0, 0.0, 1024.0, 768.0)];
        
    [self.view addSubview:vcChild.view];
    
    if (_currentViewController) {
        
        //remove the currentViewController's view from superview, remove currentViewController from parent, reset currentViewController to vcChild
        [self removeChildViewController];
        
        _currentViewController = vcChild;
        
    } else {
        
        //set the currentViewContoller to the vcChild (if not the HUD - we never remove the HUD)
        _currentViewController = vcChild;
    }
    
    [UIView animateWithDuration:.5
     
                     animations:^{
                         [vcChild.view setFrame:CGRectMake(0.0, vcChild.view.frame.origin.y, vcChild.view.frame.size.width, vcChild.view.frame.size.height)];
                         
                     }
     
                     completion:^(BOOL finished) {
                         
                     }
     ];
    
}

- (void) removeChildViewController {
    
    //This is the last method where your detailViewController can perform some operations before neing removed
    [self.currentViewController willMoveToParentViewController:nil];
    
    //remove the currentViewController view from the Container
    [self.currentViewController.view removeFromSuperview];
    
    //remove from parent (didMoveToParent) will automatically be called (vc delegate methods)
    [self.currentViewController removeFromParentViewController];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
