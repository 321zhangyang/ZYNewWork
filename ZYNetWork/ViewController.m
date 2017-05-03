//
//  ViewController.m
//  ZYNetWork
//
//  Created by 换一换 on 17/2/14.
//  Copyright © 2017年 换一换. All rights reserved.
//

#import "ViewController.h"
#import "ZYHUDHeaper.h"
#import "ZYNetWorking.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)request:(id)sender {
    
    [ZYNetWorking getWithUrl:@"app_common/markDevice" params:nil Cache:NO refreshCache:YES showHUD:@"请求数据中" success:^(id response) {
        
    } fail:^(NSError *error) {
        
    }];
    
}

- (IBAction)requestCache:(id)sender {
    
    [ZYNetWorking getWithUrl:@"app_common/markDevice" params:nil Cache:YES refreshCache:NO showHUD:@"请求数据中" success:^(id response) {
        
    } fail:^(NSError *error) {
        
    }];
}

- (IBAction)uploadImage:(id)sender {
    
    NSDictionary *dic = @{@"method":@"file.uploadavatar",@"is_debug":@"1"};
    [ZYNetWorking uploadWithImage:self.imageView.image url:@"http://api.beikeshushe.com/v3/gateway.php" filename:nil name:@"image" mimeType:@"jpg" parameters:dic progress:^(int64_t bytesWritten, int64_t totalBytesWritten) {
        
    } success:^(id response) {
        
        
        
        
    } fail:^(NSError *error) {
        
    }];
}
- (IBAction)uploadOss:(id)sender {
    //@"appu_user/getUploadUserHeadUrl" 密匙有时效性
    [ZYNetWorking updateBaseUrl:@"http://47.92.79.222:8080/server/"];
    
    NSData *data = UIImageJPEGRepresentation(self.imageView.image, 0.5);
    
    [ZYNetWorking uploadFileWithUrl:@"appu_user/getUploadUserHeadUrl?token=0a85f13f9ed849dab99e4815c173972030a8264d09414e0489e5448f071d716a" uploadBody:data progress:^(int64_t bytesWritten, int64_t totalBytesWritten) {
        
    } success:^(id response) {
        
    } fail:^(NSError *error) {
        
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
