//
//  PSTopicVideoView.h
//  YUEL
//
//  Created by sunny&pei on 2017/12/25.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PSTopic;
@interface PSTopicVideoView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong) PSTopic *topic;
@end
