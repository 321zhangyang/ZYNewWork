//
//  ViewController.m
//  ZYNetWork
//
//  Created by 换一换 on 17/2/14.
//  Copyright © 2017年 换一换. All rights reserved.
//

#import "ViewController.h"
#import "ZYHttp.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZYHttp getRequestUrl:@"http://api2.beikeshushe.com/v1/readgroup/borrowinfo?readGroupId=12" params:nil cache:NO target:self indicator:NO progressBlock:^(NSProgress *progress) {
        
    } successBlock:^(id requestDic) {
        
    } failBlock:^(NSError *error) {
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
