//
//  ZYHUDHeaper.m
//  ZYNetWorking
//
//  Created by allen on 2017/4/27.
//  Copyright © 2017年 allen. All rights reserved.
//

#import "ZYHUDHeaper.h"
//屏幕宽度
#define kWidth       [[UIScreen mainScreen] bounds].size.width
//设置比例
#define kScal kWidth/375
// 背景视图的宽度/高度
#define kBGVIEW_WIDTH 80.0f * kScal
// 文字大小
#define TEXT_SIZE    16.0f * kScal

@implementation ZYHUDHeaper


+ (instancetype)sharedHUD {
    static id hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[self alloc] initWithView:[UIApplication sharedApplication].keyWindow];
    });
    return hud;
}

+ (void)showMessage:(NSString *)text {
    
  [[self alloc] showStatus:ZYProgerssHUDHeaperMessage text:text];
    
}

+ (void)showInfoMsg:(NSString *)text {
    
    [[self alloc] showStatus:ZYProgressHUDHeaperInfo text:text];
}

+ (void)showFailure:(NSString *)text {
    
    [[self alloc] showStatus:ZYProgressHUDHeaperError text:text];
}

+ (void)showSuccess:(NSString *)text {
    
    [[self alloc] showStatus:ZYProgressHUDHeaperSuccess text:text];
}

+ (void)showLoading:(NSString *)text {
    
    [[self alloc] showStatus:ZYProgressHUDHeaperWaitting text:text];
}

+ (void)dismissHud{
    
    [[ZYHUDHeaper sharedHUD] setShowNow:NO];
    [[ZYHUDHeaper sharedHUD] hideAnimated:YES];
}





- (void)showStatus:(ZYHUDHeaperStatus)status text:(NSString *)text {
    
    ZYHUDHeaper *hud = [ZYHUDHeaper sharedHUD];
    hud.userInteractionEnabled = NO;
    [hud showAnimated:YES];
    [hud setShowNow:YES];
    hud.label.text = text;
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud setMinSize:CGSizeMake(kBGVIEW_WIDTH, kBGVIEW_WIDTH)];
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ZYHUDHeaper" ofType:@"bundle"];
    
    switch (status) {
            
        case ZYProgressHUDHeaperSuccess: {
            
            NSString *sucPath = [bundlePath stringByAppendingPathComponent:@"hud_success@2x.png"];
            UIImage *sucImage = [UIImage imageWithContentsOfFile:sucPath];
            
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *sucView = [[UIImageView alloc] initWithImage:sucImage];
            hud.customView = sucView;
            
            [hud hideAnimated:YES afterDelay:1.5f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud setShowNow:NO];
            });
        }
            break;
            
        case ZYProgressHUDHeaperError: {
            
            NSString *errPath = [bundlePath stringByAppendingPathComponent:@"hud_error@2x.png"];
            UIImage *errImage = [UIImage imageWithContentsOfFile:errPath];
            
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *errView = [[UIImageView alloc] initWithImage:errImage];
            hud.customView = errView;
            
            [hud hideAnimated:YES afterDelay:1.5f];
   
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud setShowNow:NO];
            });
        }
            break;
            
        case ZYProgressHUDHeaperWaitting: {
            
            hud.mode = MBProgressHUDModeIndeterminate;
        }
            break;
            
        case ZYProgressHUDHeaperInfo: {
            
            NSString *infoPath = [bundlePath stringByAppendingPathComponent:@"hud_info@2x.png"];
            UIImage *infoImage = [UIImage imageWithContentsOfFile:infoPath];
            
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *infoView = [[UIImageView alloc] initWithImage:infoImage];
            hud.customView = infoView;
            
            [hud hideAnimated:YES afterDelay:1.5f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud setShowNow:NO];
            });
        }
            break;
            
        case ZYProgerssHUDHeaperMessage:
        {
            
            [hud setMode:MBProgressHUDModeText];
            [hud hideAnimated:YES afterDelay:1.5f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud setShowNow:NO];
            });
            
        }
            break;
    
            
        default:
            break;
    }
}



@end
