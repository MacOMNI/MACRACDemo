//
//  RACListView.m
//  RACDemo
//
//  Created by MacKun on 2017/2/14.
//  Copyright © 2017年 com.soullon. All rights reserved.
//

#import "RACListView.h"

#import "MVVMRACViewModel.h"
@interface RACListView()<UITableViewDataSource,UITableViewDelegate>{
    
}
@property (nonatomic,strong) MVVMRACViewModel *viewModel;
@end

@implementation RACListView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUP];
    }
    
    return self;
}
-(void)setUP{
    self.delegate = self;
    self.dataSource = self;
    self.tableFooterView = [UIView new];
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.viewModel = [[MVVMRACViewModel alloc]init];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        RACListModel *model = [RACListModel new];
//        model.avctorURL = @"https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTrEO_em0Oq7lIjAeAbGI7Va4MvEyHAFJRYt5NhU47EXWH-PDNWOinnCP8J";
//        model.title = @"WoW";
//        for (NSUInteger i = 0; i < 10; i++) {
//            model.userName = [NSString stringWithFormat:@"indexpath%ld",i];
//            NSLog(@"self.modelArrCount = %@",model.userName);
//
//        }
//    });

  //  @weakify[(self);
    [[self.viewModel.operationCommand.executionSignals doNext:^(id x) {
        NSLog(@"doNext modelArrCount = %ld",self.viewModel.modelArr.count);
        [self reloadData];

    }]subscribeNext:^(id x) {
      //  @strongify(self)

        NSLog(@"OperationCommand 订阅");

    } completed:^{
        NSLog(@"completed modelArrCount = %ld",self.viewModel.modelArr.count);

    }];
    [[self.viewModel.operationCommand execute:nil] subscribeNext:^(id x) {
        NSLog(@"OperationCommand execute 订阅");
        [self reloadData];

    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.modelArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.viewModel.modelArr[indexPath.row].userName;
    
    return cell;
}
@end
