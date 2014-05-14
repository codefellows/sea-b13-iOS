//
//  ViewController.m
//  gkdemo
//
//  Created by John Clem on 5/14/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"
#import "GameKitHelper.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(showAuthenticationViewController)
     name:PresentAuthenticationViewController
     object:nil];
    
    [[GameKitHelper sharedGameKitHelper]
     authenticateLocalPlayer];
}

- (void)showAuthenticationViewController
{
    GameKitHelper *gameKitHelper =
    [GameKitHelper sharedGameKitHelper];
    
    [self presentViewController:gameKitHelper.authenticationViewController
                       animated:YES
                     completion:nil];
}

- (IBAction)stepperChanged:(id)sender
{
    NSInteger newPointsValue = (NSInteger)[(UIStepper *)sender value];
    
    _pointsLabel.text = [NSString stringWithFormat:@"%d", newPointsValue];
    
    NSLog(@"Reporting Score: %d", newPointsValue);
    
    [[GameKitHelper sharedGameKitHelper] reportScore:newPointsValue forLeaderboardID:@"com.minddiaper.gkdemo.highscores"];
    
    
    if (newPointsValue == 10) {
        GKAchievement *tenPointsAchievement = [[GKAchievement alloc] initWithIdentifier:@"com.minddiaper.gkdemo.tentaps" forPlayer:[GKLocalPlayer localPlayer].playerID];
        [tenPointsAchievement setPercentComplete:100];
        tenPointsAchievement.showsCompletionBanner = YES;
        
        [GKAchievement reportAchievements:@[tenPointsAchievement] withCompletionHandler:^(NSError *error) {
            NSLog(@"Reported Achievement");
            
        }];
    }
}

@end
