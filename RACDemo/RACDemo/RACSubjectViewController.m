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
    //MARK:一、RACSubject 和 RACReplaySubject
    /*
     RACSubject:信号提供者，自己可以充当信号，又能发送信号。使用场景:通常用来代替代理，有了它，就不必要定义代理了。
     RACReplaySubject:重复提供信号类，RACSubject的子类。RACReplaySubject可以先发送信号，在订阅信号，RACSubject就不可以。
     使用场景一:如果一个信号每被订阅一次，就需要把之前的值重复发送一遍，使用重复提供信号类。
     使用场景二:可以设置capacity数量来限制缓存的value的数量,即只缓充最新的几个值。
     
     
     RACSubject和RACReplaySubject简单使用:
     1.创建信号 [RACSubject subject]，跟RACSiganl不一样，创建信号时没有block。
     2.订阅信号 - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
     3.发送信号 sendNext:(id)value
     
     RACSubject:底层实现和RACSignal不一样。
     1.调用subscribeNext订阅信号，只是把订阅者保存起来，并且订阅者的nextBlock已经赋值了。
     2.调用sendNext发送信号，遍历刚刚保存的所有订阅者，一个一个调用订阅者的nextBlock。
     */
    
    /*
     RACReplaySubject使用步骤:
     1.创建信号 [RACSubject subject]，跟RACSiganl不一样，创建信号时没有block。
     2.可以先订阅信号，也可以先发送信号。
     2.1 订阅信号 - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
     2.2 发送信号 sendNext:(id)value
     
     RACReplaySubject:底层实现和RACSubject不一样。
     1.调用sendNext发送信号，把值保存起来，然后遍历刚刚保存的所有订阅者，一个一个调用订阅者的nextBlock。
     2.调用subscribeNext订阅信号，遍历保存的所有值，一个一个调用订阅者的nextBlock
     
     如果想当一个信号被订阅，就重复播放之前所有值，需要先发送信号，在订阅信号。
     也就是先保存值，在订阅值。
     */

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
