//
//  VideoTableViewCell.m
//  XJPlayerTransition
//
//  Created by XJIMI on 2019/1/22.
//  Copyright © 2019 XJIMI. All rights reserved.
//

#import "VideoTableViewCell.h"

@interface VideoTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *playerView;

@end

@implementation VideoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)action_fullscreen:(id)sender {
    if ([self.delegate respondsToSelector:@selector(fullscreenWithPlayerView:containerView:)]) {
        [self.delegate fullscreenWithPlayerView:self.playerView.subviews.firstObject containerView:self.playerView];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
