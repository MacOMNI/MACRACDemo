//
//  RACSignalViewController.m
//  RACDemo
//
//  Created by MacKun on 2016/12/7.
//  Copyright © 2016年 com.soullon. All rights reserved.
//

#import "RACSignalViewController.h"

#import <ReactiveCocoa.h>

@interface RACSignalViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *anwserButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end

@implementation RACSignalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    
    [[_textField.rac_textSignal map:^id(NSString *value) {
        return value;
    }] subscribeNext:^(id x) {
        NSLog(@"监听者 value = %@",x);
    }];//本类内监听 textField 文本变化 映射
    
    RAC(_timeLabel,text) = [[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] map:^NSString*(NSDate * date) {
        return date.description;
    }];//绑定 映射
    
    [[_anwserButton  rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *btn) {
        
        NSString *text = [_textView.text stringByAppendingString:_textField.text];
        NSLog(@"录入的数据是 ： %@",text);
    }];//监听按钮事件
    
    
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
