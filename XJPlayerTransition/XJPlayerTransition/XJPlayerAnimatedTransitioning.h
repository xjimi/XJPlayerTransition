//
//  XJPlayerAnimatedTransitioning.h
//  XJPlayerTransition
//
//  Created by XJIMI on 2019/1/22.
//  Copyright © 2019 XJIMI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>

typedef NS_ENUM(NSUInteger, XJPlayerTransitionType) {
    XJPlayerTransitionTypePresent,
    XJPlayerTransitionTypeDismiss,
};

NS_ASSUME_NONNULL_BEGIN

@interface XJPlayerAnimatedTransitioning : NSObject < UIViewControllerAnimatedTransitioning >

@property (nonatomic, strong) UIView *sourceView;
@property (nonatomic, strong) UIView *targetView;
@property (nonatomic, strong) UIView *playerView;

@property (nonatomic, assign) AVLayerVideoGravity sourceGravity;
@property (nonatomic, assign) AVLayerVideoGravity targetGravity;

@property (nonatomic, assign) NSTimeInterval duration;

+ (instancetype)initWithPlayerTransitionType:(XJPlayerTransitionType)transitionType;

@end

NS_ASSUME_NONNULL_END
