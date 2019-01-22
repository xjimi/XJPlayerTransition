//
//  VideoTableViewCell.h
//  XJPlayerTransition
//
//  Created by XJIMI on 2019/1/22.
//  Copyright © 2019 XJIMI. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class VideoTableViewCell;

@protocol VideoTableViewCellDelegate <NSObject>

@optional
- (void)fullscreenWithPlayerView:(UIView *)playerView;

@end

@interface VideoTableViewCell : UITableViewCell

@property (nonatomic, weak) id < VideoTableViewCellDelegate > delegate;

@end

NS_ASSUME_NONNULL_END
