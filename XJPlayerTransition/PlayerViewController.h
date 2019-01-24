//
//  PlayerViewController.h
//  XJPlayerTransition
//
//  Created by XJIMI on 2019/1/24.
//  Copyright © 2019 XJIMI. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PlayerViewControllerDelegate <NSObject>

@optional
- (void)fullScreenWithPlayerView:(UIView *)playerView containerView:(UIView *)containerView;

@end

@interface PlayerViewController : ViewController

@property (nonatomic, weak) id < PlayerViewControllerDelegate > delegate;

@end

NS_ASSUME_NONNULL_END
