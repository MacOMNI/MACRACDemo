//
//  RACSubjectViewController.m
//  RACDemo
//
//  Created by MacKun on 2016/12/13.
//  Copyright © 2016年 com.soullon. All rights reserved.
//

#import "RACSubjectViewController.h"

@interface RACSubjectViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *SubjectButton;

@end

@implementation RACSubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    
}
-(void)initData{
    self.subject = [RACSubject  subject];
    [self.subject subscribeNext:^(NSString *x) {
        _textView.text = x;
    }];
//    [[_SubjectButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        [self.subject sendNext:[NSDate date].description];
//    }];
    [[_SubjectButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        [self.subject sendNext:[NSDate date].description];

    }];
//    RAC(_SubjectButton,allControlEvents) = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //               [self.subject sendNext:[NSDate date].description];

//        
//        [subscriber sendCompleted];
//
//        return [RACDisposable disposableWithBlock:^{
//            
//        }];
//        
//    }];
    
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
