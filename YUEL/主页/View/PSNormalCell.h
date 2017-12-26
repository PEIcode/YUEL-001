//
//  PSNormalCell.h
//  YUEL
//
//  Created by sunny&pei on 2017/12/15.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PSTopic;
@interface PSNormalCell : UITableViewCell
/**
 帖子的模型数据
 */
@property(nonatomic,strong) PSTopic *topic;
@end
