//
//  MVVMRACViewModel.h
//  RACDemo
//
//  Created by MacKun on 2017/2/14.
//  Copyright © 2017年 com.soullon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACListModel.h"
#import <ReactiveCocoa.h>
@interface MVVMRACViewModel : NSObject

@property (nonatomic,strong) NSMutableArray<RACListModel *> *modelArr;//获取相关参数

@property (nonatomic,strong) RACCommand *operationCommand;//获取操作命令


@end
