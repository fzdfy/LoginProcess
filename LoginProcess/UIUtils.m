//
//  UIUtils.m
//  ChatApp
//
//  Created by MAC-MFQ on 2016/11/7.
//  Copyright © 2016年 ustcinfo. All rights reserved.
//

#import "UIUtils.h"

@implementation UIUtils


/**
 拉伸图片

 @param image 原图
 @param size 目标尺寸
 @return 目标图片
 */
+(UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(CGSizeMake(size.width,size.height));
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+(CGFloat)transferWidth:(CGFloat) num {
    
    return num * widthRatio;
    
}

+(CGFloat)transferHeight:(CGFloat) num {
    
    return num * heightRatio;
}

@end
