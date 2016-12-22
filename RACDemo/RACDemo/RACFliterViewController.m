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
    _searchBar.delegate = self;
      _searchSignal = [[[[[self rac_signalForSelector:@selector(searchBar:textDidChange:) fromProtocol:@protocol(UISearchBarDelegate)] throttle:0.3] distinctUntilChanged] ignore:@""] map:^id(RACTuple *tuple) {
                return tuple.second;
        }];
    [_searchSignal subscribeNext:^(id x) {
        _textView.text = x;
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
