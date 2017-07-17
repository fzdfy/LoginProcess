//
//  UIUtils.h
//  ChatApp
//
//  Created by MAC-MFQ on 2016/11/7.
//  Copyright © 2016年 ustcinfo. All rights reserved.
//

#import <Foundation/Foundation.h>



#define widthRatio SCREENWIDTH/640
#define heightRatio SCREENHEIGHT/1136

@interface UIUtils : NSObject

//拉伸图片

+(UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;

+(CGFloat)transferWidth:(CGFloat) num;
+(CGFloat)transferHeight:(CGFloat) num;
@end
