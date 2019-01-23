//
//  ViewController.m
//  XJPlayerTransition
//
//  Created by XJIMI on 2019/1/22.
//  Copyright © 2019 XJIMI. All rights reserved.
//

#import "ViewController.h"
#import "XJPlayerFullScreenViewController.h"
#import "XJPlayerTransitioningDelegate.h"
#import "VideoTableViewCell.h"

@interface ViewController () < UITableViewDelegate, UITableViewDataSource, VideoTableViewCellDelegate >

@property (weak, nonatomic) IBOutlet UIView *playerView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.view.bounds = [UIScreen mainScreen].bounds;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.delegate = self;
    return cell;
}

- (void)fullscreenWithPlayerView:(UIView *)playerView
{
    XJPlayerFullScreenViewController *vc = [[XJPlayerFullScreenViewController alloc] init];
    XJPlayerTransitioningDelegate *transition = vc.transition;
    transition.sourceView = playerView;
    //transition.sourceGravity = .resizeAspect
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.transitioningDelegate = transition;
    [self presentViewController:vc animated:YES completion:nil];

}

- (IBAction)action_fullscreen:(id)sender
{
    XJPlayerFullScreenViewController *vc = [[XJPlayerFullScreenViewController alloc] init];
    XJPlayerTransitioningDelegate *transition = vc.transition;
    //transition.targetView = vc.playerContainer;
    transition.sourceView = self.playerView;
    //transition.sourceGravity = .resizeAspect
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.transitioningDelegate = transition;
    [self presentViewController:vc animated:YES completion:nil];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}




@end
