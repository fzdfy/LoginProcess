//
//  UIUtilsDefine.h
//  ChatApp
//
//  Created by MAC-MFQ on 2016/11/8.
//  Copyright © 2016年 ustcinfo. All rights reserved.
//

#ifndef UIUtilsDefine_h
#define UIUtilsDefine_h

#import "UIUtils.h"

#define UIUtilsScaleImage(image,size) [UIUtils scaleImage:image toSize:size]

/** 字体大小 */
#define SystemFont @"STHeitiSC-Light"
#define UIUtilsFont(NAME,FONTSIZE) [UIFont fontWithName:(NAME) size:(FONTSIZE)]
#define UIUtilsFontSize(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define UIUtilsBoldFontSize(FONTSIZE)   [UIFont boldSystemFontOfSize:FONTSIZE]
#define UIUtilsSystemFont(FONTSIZE) [UIFont fontWithName:(SystemFont) size:(FONTSIZE)]


#define UIUtilsTransferWidth(width) [UIUtils transferWidth:width ]
#define UIUtilsTransferHeight(height) [UIUtils transferHeight:height ]

//设置 view 圆角和边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


#endif /* UIUtilsDefine_h */
