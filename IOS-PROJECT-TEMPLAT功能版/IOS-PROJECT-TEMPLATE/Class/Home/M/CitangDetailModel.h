//
//  CitangDetailModel.h
//  IOS-PROJECT-TEMPLATE
//
//  Created by ginluck on 2020/5/29.
//  Copyright © 2020年 梦境网络. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FamilyTreeMember.h"
NS_ASSUME_NONNULL_BEGIN

@interface CitangDetailModel : NSObject
@property(nonatomic,strong)NSString * updateTime;
@property(nonatomic,strong)NSString * userUserId;
@property(nonatomic,strong)NSString * theme;
@property(nonatomic,strong)NSString * ctJs;
@property(nonatomic,strong)NSString * jzId;
@property(nonatomic,strong)NSString * ctJs2;
@property(nonatomic,strong)NSString * deleteStatus;
@property(nonatomic,strong)NSString * id;
@property(nonatomic,strong)NSString * name2;
@property(nonatomic,strong)NSString * img;
@property(nonatomic,strong)NSString * ancestralHome;

@property(nonatomic,strong)NSString * type;
@property(nonatomic,strong)NSString * userName;
@property(nonatomic,strong)NSString * createTime;
@property(nonatomic,strong)NSString * img2;
@property(nonatomic,strong)NSString * name;

@property(nonatomic,strong)NSArray <FamilyTreeMember *> * zpList;

@end

NS_ASSUME_NONNULL_END
