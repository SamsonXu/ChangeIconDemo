//
//  ChangeIconViewController.m
//  TestProject
//
//  Created by iOS－Dev on 2017/4/26.
//  Copyright © 2017年 iOS－Dev. All rights reserved.
//

#import "ChangeIconViewController.h"
#import "Define.h"
#import "Masonry/Masonry.h"
@interface ChangeIconViewController ()

@end

@implementation ChangeIconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)createUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"更换icon";
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"changeICon" forState:UIControlStateNormal];
    [btn setTitleColor:KColorRGB(121, 52, 135) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    __weak typeof(self) weak = self;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weak.view);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
}

- (void)btnClick:(UIButton *)sender{
    
    if ([[UIApplication sharedApplication] supportsAlternateIcons]) {
        NSLog(@"you can change icon");
    }else{
        NSLog(@"you could't change icon");
        return;
    }
    
    if ([[[UIApplication sharedApplication]alternateIconName] isEqualToString:@"blackBgColor"]) {
        [[UIApplication sharedApplication]setAlternateIconName:nil completionHandler:^(NSError * _Nullable error) {
            NSLog(@"change success!");
        }];
    }else{
        [[UIApplication sharedApplication]setAlternateIconName:@"blackBgColor" completionHandler:^(NSError * _Nullable error) {
            NSLog(@"change success!");
        }];
    }
    
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
