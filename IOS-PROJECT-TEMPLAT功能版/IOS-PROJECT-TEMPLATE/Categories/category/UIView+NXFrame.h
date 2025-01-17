//
//  UIView+NXFrame.h
//
//  Created by he on 14-5-26.
//  Copyright (c) 2014年 NX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NXFrame)
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat maxX;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat maxY;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;
@end
