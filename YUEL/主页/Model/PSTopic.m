//
//  PSTopic.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/22.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSTopic.h"
#import "NSDate+XMGExtension.h"
#import "NSCalendar+XMGExtension.h"
@implementation PSTopic
static NSDateFormatter *fmt_;
static NSCalendar *calendar_;

/**
     第一次使用PSTopic类时调用
 */
+(void)initialize{
    fmt_ = [[NSDateFormatter alloc]init];
    calendar_ = [NSCalendar calendar];
}

-(NSString *)created_at{
    //获得发帖日期
    fmt_.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *createdAtDate = [fmt_ dateFromString:_created_at];
    
    if (createdAtDate.isThisYear) {//今年
        if (createdAtDate.isToday) {
            NSDate *nowDate = [NSDate date];
            NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
            NSDateComponents *cmps = [calendar_ components:unit fromDate:createdAtDate toDate:nowDate options:0];
            if (cmps.hour >= 1) { // 时间间隔 >= 1小时
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1小时 > 时间间隔 >= 1分钟
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else { // 1分钟 > 分钟
                return @"刚刚";
            }
        }else if (createdAtDate.isYesterday) { // 昨天
            fmt_.dateFormat = @"昨天 HH:mm:ss";
            return [fmt_ stringFromDate:createdAtDate];
        } else { // 其他
            fmt_.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt_ stringFromDate:createdAtDate];
        }
    }else {
        return _created_at;
    }
    
}
-(CGFloat)cellHeight{
    if (_cellHeight) {
        return _cellHeight;
    }
    //1.头像
    _cellHeight = 55;
    //2.文字
    CGFloat textMaxW = [UIScreen mainScreen].bounds.size.width - 20;
    CGSize textMaxSize = CGSizeMake(textMaxW, MAXFLOAT);
    CGSize textSize = [self.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:15]} context:nil].size;
    _cellHeight += textSize.height + 10;
    //3.中间内容
    if (self.type != PSTopicTypeWord) { // 如果是图片\声音\视频帖子, 才需要计算中间内容的高度
        // 中间内容的高度 == 中间内容的宽度 * 图片的真实高度 / 图片的真实宽度
        CGFloat contentH = textMaxW * self.height / self.width;
        
        if (contentH >= [UIScreen mainScreen].bounds.size.height) { // 超长图片
            // 将超长图片的高度变为200
            contentH = 200;
            self.bigPicture = YES;
        }
        
        // 这里的cellHeight就是中间内容的y值
        self.contentF = CGRectMake(10, _cellHeight, textMaxW, contentH);
        
        // 累加中间内容的高度
        _cellHeight += contentH + 10;
    }
    // 4.底部工具条
    _cellHeight += 45;
    return _cellHeight;
}

@end
