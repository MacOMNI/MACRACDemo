//
//  RACListModel.h
//  RACDemo
//
//  Created by MacKun on 2017/2/14.
//  Copyright © 2017年 com.soullon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@interface RACListModel : NSObject

@property (nonatomic,copy) NSString *avctorURL;//头像地址

@property (nonatomic,copy) NSString *userName;//用户姓名

@property (nonatomic,copy) NSString *title;//标题说明

@end
