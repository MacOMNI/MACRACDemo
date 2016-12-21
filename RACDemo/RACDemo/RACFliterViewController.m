//
//  RACFliterViewController.m
//  RACDemo
//
//  Created by MacKun on 2016/12/19.
//  Copyright © 2016年 com.soullon. All rights reserved.
//

#import "RACFliterViewController.h"
#import <ReactiveCocoa.h>
#import <objc/objc-runtime.h>
@interface RACFliterViewController ()<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *filterButton;
@property (nonatomic,strong) RACSignal *searchSignal;
@end

@implementation RACFliterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
    // Do any additional setup after loading the view.
}
-(void)initUI{
   // 这段代码的意思是若1秒内无新信号无输入),并且输入框内不为空那么将会执行,这对服务器的压力减少有巨大帮助同时提高了用户体验
     // RAC(self.searchBar,text) =
//    RAC(self.searchBar,text) = [[[[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendCompleted];
//        return [RACDisposable disposableWithBlock:^{
//            NSLog(@"这段代码的意思是若1秒内无新信号无输入");
//        }];
//    }]throttle:1.0] distinctUntilChanged] ignore:@""] map:^id(id value) {
//        return value;
//    }];
//    _searchBar.delegate = (id)_searchBar;
//   // RACSignal *signal = objc_getAssociatedObject(_searchBar, _cmd);
//   // if (signal != nil) return signal;
//    _searchSignal = [[self rac_signalForSelector:@selector(searchBar:textDidChange:) fromProtocol:@protocol(UISearchBarDelegate)] map:^id(RACTuple *tuple) {
//        return tuple.second;
//    }];
   // objc_setAssociatedObject(_searchBar, _cmd, _searchSignal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//   _searchSignal = [[_searchBar rac_signalForSelector:@selector(searchBar:textDidChange:) fromProtocol:@protocol(UISearchBarDelegate)] map:^id(RACTuple *tuple) {
//       NSLog(@"value = %@",tuple.second);
//       return tuple.second;
//   }];
//    [_searchSignal subscribeNext:^(id x) {
//        NSLog(@"value = %@",x);
//    }];
    _searchSignal = [RACObserve(_searchBar, text)  map:^id(id value) {
        return value;
    }];
    [_searchSignal subscribeNext:^(id x) {
        NSLog(@"textChange = %@",x);
    }];
}
-(void)initData{
    
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
