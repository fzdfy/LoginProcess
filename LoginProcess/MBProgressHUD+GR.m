//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+GR.h"
#import "AppDelegate.h"
#define kopacity    0.7

@implementation MBProgressHUD (GR)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) {
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        view = delegate.window;
    }
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:0.7];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}
+ (void)showIndicatorWithView:(UIView *)view
{
    if (view == nil) {
        AppDelegate *delegate = (id)[UIApplication sharedApplication].delegate;
        view = delegate.window;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    
    hud.removeFromSuperViewOnHide = YES;
}
+ (void)showIndicator
{
    [self showIndicatorWithView:nil];
}
#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view complication:(ComplicationOption)option{
    
    AppDelegate *delegate = (id)[UIApplication sharedApplication].delegate;
    view = delegate.window;
    //if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.mode = MBProgressHUDModeText;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;

    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    
    hud.animationType = MBProgressHUDAnimationZoom;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.5];
    
    
//    __unsafe_unretained typeof(hud) weakHud = hud;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        if (weakHud) {
//            
//            [weakHud hide:YES];
//        }
//        
//        if (option) {
//            
//            option();
//        }
//    });
    
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message complication:(ComplicationOption)option
{
    return [self showMessage:message toView:nil complication:option];
}
+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message complication:nil];
}
+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) {
        AppDelegate *delegate = (id)[UIApplication sharedApplication].delegate;
        view = delegate.window;
    }
    [self hideHUDForView:view animated:NO];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}


//+ (void)hideAllHUD
//{
//    UIView *view = [[UIApplication sharedApplication].windows lastObject];
//    
//    [self hideAllHUDsForView:view animated:YES];
//}
@end
