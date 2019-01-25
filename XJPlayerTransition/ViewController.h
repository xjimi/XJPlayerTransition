//
//  ViewController.h
//  XJPlayerTransition
//
//  Created by XJIMI on 2019/1/22.
//  Copyright © 2019 XJIMI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, assign) BOOL statusBarHidden;
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (nonatomic, assign) UIStatusBarAnimation statusBarAnimation;

- (void)setStatusBarHidden:(BOOL)hidden animation:(UIStatusBarAnimation)animation;

- (void)setStatusBarHidden:(BOOL)hidden
            statusBarStyle:(UIStatusBarStyle)statusBarStyle
                 animation:(UIStatusBarAnimation)animation
                completion:(void (^ __nullable)(BOOL finished))completion;

- (void)presentFullScreenWithPlayerView:(UIView *)playerView containerView:(UIView *)containerView;

@end

