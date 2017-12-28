//
//  PSTopicVideoView.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/25.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSTopicVideoView.h"
@implementation PSTopicVideoView

-(void)awakeFromNib{
    self.autoresizingMask = UIViewAutoresizingNone;
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seeBig)]];
}
-(void)seeBig{
    //点击事件  加载视频
}
-(void)setTopic:(PSTopic *)topic{
    _topic = topic;
    //设置一个图片
}
@end
