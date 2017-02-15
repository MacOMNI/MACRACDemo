//
//  MVVMRACViewModel.m
//  RACDemo
//
//  Created by MacKun on 2017/2/14.
//  Copyright © 2017年 com.soullon. All rights reserved.
//

#import "MVVMRACViewModel.h"
@implementation MVVMRACViewModel

-(instancetype)init{
    if (self = [super init]) {
        [self setUP];
    }
    
    return self;
}

-(void)setUP{
    self.modelArr = [NSMutableArray array];
    @weakify(self)
    self.operationCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            @strongify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                @strongify(self)
                RACListModel *model = [RACListModel new];
                model.avctorURL = @"https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTrEO_em0Oq7lIjAeAbGI7Va4MvEyHAFJRYt5NhU47EXWH-PDNWOinnCP8J";
                model.title = @"WoW";
                for (NSUInteger i = 0; i < 10; i++) {
                    model.userName = [NSString stringWithFormat:@"indexpath%ld",i];
                    [self.modelArr addObject:model];
                }
                NSLog(@"self.modelArrCount = %ld",self.modelArr.count);
                [subscriber sendNext:nil];
                [subscriber sendCompleted];

            });
            
            return nil;
        }];
    }];
}
@end
