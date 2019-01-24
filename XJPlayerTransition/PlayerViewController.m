//
//  PlayerViewController.m
//  XJPlayerTransition
//
//  Created by XJIMI on 2019/1/24.
//  Copyright © 2019 XJIMI. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@property (nonatomic, strong) UIImageView *playerView;

@end

@implementation PlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"img"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = NO;
    [self fitParentViewWithSubView:imageView];
    self.playerView = imageView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([self.delegate respondsToSelector:@selector(fullScreenWithPlayerView:containerView:)]) {
        [self.delegate fullScreenWithPlayerView:self.playerView containerView:self.view];
    }
}

- (void)fitParentViewWithSubView:(UIView *)subview
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *viewTop = [NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *viewLeft = [NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *viewRight = [NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    NSLayoutConstraint *viewBottom = [NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [subview.superview addConstraints:@[viewTop, viewLeft, viewRight, viewBottom]];
}


@end
