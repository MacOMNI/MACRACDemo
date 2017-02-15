//
//  MVVMListViewController.m
//  RACDemo
//
//  Created by MacKun on 2017/2/14.
//  Copyright © 2017年 com.soullon. All rights reserved.
//

#import "MVVMListViewController.h"
#import "RACListView.h"
@interface MVVMListViewController (){
    
}
@property (nonatomic,strong) RACListView *listView;
@end

@implementation MVVMListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view from its nib.
}
-(void)initUI{
    RACListView *listView = [[RACListView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:listView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
