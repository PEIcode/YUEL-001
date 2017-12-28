//
//  PSTopicPicView.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/22.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSTopicPicView.h"
@interface PSTopicPicView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation PSTopicPicView
-(void)awakeFromNib{
    self.autoresizingMask = UIViewAutoresizingNone;
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seeBig)]];
}
-(void)seeBig{
    //点击事件  加载图片
}
-(void)setTopic:(PSTopic *)topic{
    _topic = topic;
    // 自己放一张图
    
}

@end
