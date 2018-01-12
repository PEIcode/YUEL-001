//
//  PSTopicVideoView.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/25.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSTopicVideoView.h"
@import AVKit;
@import AVFoundation;
@implementation PSTopicVideoView

-(void)awakeFromNib{
    self.autoresizingMask = UIViewAutoresizingNone;
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seeBig)]];
}
-(void)seeBig{
    //点击事件  加载视频  需要modal一个控制器
    NSString *path = [[NSBundle mainBundle]pathForResource:@"/Users/sunnypei/Desktop/Swift3.0 新浪微博项目视频/04-Swift-第03天(项目搭建)" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerViewController *playerVC = [AVPlayerViewController new];
    playerVC.player = player;
//    [self presen];
//    playerVC.modalPresentationStyle
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:playerVC animated:YES completion:nil];
    
}
-(void)setTopic:(PSTopic *)topic{
    _topic = topic;
    //设置一个图片
}
@end
