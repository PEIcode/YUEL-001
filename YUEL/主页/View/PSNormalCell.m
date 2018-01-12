//
//  PSNormalCell.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/15.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSNormalCell.h"
#import "PSTopicPicView.h"
#import "PSTopicVideoView.h"
#import "PSTopic.h"
@interface PSNormalCell()
@property (weak, nonatomic) IBOutlet UIButton *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_label;
@property (weak, nonatomic) IBOutlet UILabel *acceptLabe;

@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
/**中间控件*/
@property(nonatomic,strong) PSTopicPicView *picView;
@property(nonatomic,strong) PSTopicVideoView *videoView;
@end
@implementation PSNormalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(PSTopicPicView *)picView{
    if (!_picView) {
        PSTopicPicView *picView = [[PSTopicPicView alloc]init];
        [self.contentView addSubview:picView];
        _picView = picView;
    }
    return _picView;
}
-(PSTopicVideoView *)videoView{
    if (!_videoView) {
        PSTopicVideoView *videoView = [[PSTopicVideoView alloc]init];
        [self.contentView addSubview:videoView];
        _videoView = videoView;
    }
    return _videoView;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setTopic:(PSTopic *)topic{
    _topic = topic;
    //设置头像
    [self.profileImage setBackgroundImage:[UIImage imageNamed:@"icon111"] forState:UIControlStateNormal];
    self.nameLabel.text = topic.name;
    self.createdAtLabel.text = topic.created_at;
    self.text_label.text = topic.text;
    self.acceptLabe.text = @"78%";
    
    //中间内容
    if(topic.type == PSTopicTypeVideo){//视频
        self.videoView.hidden = NO;
        self.videoView.frame = topic.contentF;
        self.videoView.topic = topic;
        
        self.picView.hidden = YES;
    }else if (topic.type == PSTopicTypePicture){
        self.picView.hidden = NO;
        self.picView.frame = topic.contentF;
        self.picView.topic = topic;
        
        self.videoView.hidden = YES;
    }else if (topic.type == PSTopicTypeWord){
        self.videoView.hidden = YES;
        self.picView.hidden = YES;
    }
    
    
}
/**
 *  重写这个方法的目的: 能够拦截所有设置cell frame的操作
 */
- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 10;
    frame.origin.y += 10;
    
    [super setFrame:frame];
}
@end
