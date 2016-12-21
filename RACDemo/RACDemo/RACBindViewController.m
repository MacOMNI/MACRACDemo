//
//  RACBindViewController.m
//  RACDemo
//
//  Created by MacKun on 2016/12/19.
//  Copyright © 2016年 com.soullon. All rights reserved.
//

#import "RACBindViewController.h"
#import "ReactiveCocoa.h"
#import "RACReturnSignal.h"
@interface RACBindViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *bindButton;
@property (nonatomic,strong) RACSignal *bindSignal;
@end

@implementation RACBindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    _bindSignal = [_textField.rac_textSignal bind:^RACStreamBindBlock{
        
        return ^RACSignal *(id value, BOOL *stop){
            // block调用:只要原信号发送数据,就会调用block
            // block作用:处理原信号内容
            // value:原信号发送的内容
            
            NSLog(@"接收到原信号的内容%@",value);
            // 返回信号,不能传nil,返回空信号[RACSignal empty]
            return [RACReturnSignal return:value];
        };
        
    }];
}
-(void)initData{
    [_bindSignal subscribeNext:^(id x) {
        NSLog(@"接收到绑定信号处理完的内容%@",x);
        _textView.text = x;
    }];
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
