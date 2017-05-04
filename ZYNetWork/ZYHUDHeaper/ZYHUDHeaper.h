//
//  ZYHUDHeaper.h
//  ZYNetWorking
//
//  Created by allen on 2017/4/27.
//  Copyright © 2017年 allen. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>
typedef NS_ENUM(NSInteger, ZYHUDHeaperStatus) {
    
    /** 信息 */
    ZYProgerssHUDHeaperMessage,
    
    /** 成功 */
    ZYProgressHUDHeaperSuccess,
    
    /** 失败 */
    ZYProgressHUDHeaperError,
    
    /** 提示 */
    ZYProgressHUDHeaperInfo,
    
    /** 等待 */
    ZYProgressHUDHeaperWaitting
};

@interface ZYHUDHeaper : MBProgressHUD

/**
 *  是否正在显示
 */
@property (nonatomic, assign, getter=isShowNow) BOOL showNow;
/** 返回一个 HUD 的单例 */
+ (instancetype)sharedHUD;

/** 在 window 上添加一个只显示文字的 HUD */
+ (void)showMessage:(NSString *)text;

/** 在 window 上添加一个提示`信息`的 HUD */
+ (void)showInfoMsg:(NSString *)text;

/** 在 window 上添加一个提示`失败`的 HUD */
+ (void)showFailure:(NSString *)text;

/** 在 window 上添加一个提示`成功`的 HUD */
+ (void)showSuccess:(NSString *)text;

/** 在 window 上添加一个提示`等待`的 HUD, 需要手动关闭 */
+ (void)showLoading:(NSString *)text;

/** 手动隐藏 HUD */
+ (void)dismissHud;
@end
