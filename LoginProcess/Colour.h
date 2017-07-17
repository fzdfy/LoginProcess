//
//  Colour.h
//  ChatApp
//
//  Created by MAC-MFQ on 16/8/26.
//  Copyright © 2016年 ustcinfo. All rights reserved.
//

#ifndef Colour_h
#define Colour_h


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGB(r, g, b)     RGBA(r, g, b, 1.0f)

#define UIColorFromRGBA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define TabBar_Color RGB(0, 0, 0)
#define histroyTextColor UIColorFromRGB(0xd1d1d1)
#define AskBtnLayer_Color UIColorFromRGB(0xffab1e)
#define OnlineSupportBG_Color UIColorFromRGB(0xf8f8f8)
#define TabBar_Tint_Color UIColorFromRGB(0xdae6f1)
#define Bar_Color UIColorFromRGB(0xff8300)
#define StatusBar_Color UIColorFromRGB(0xffa60a)
#define MenuLine_Color Bar_Color
#define QuestDetailTable_Color UIColorFromRGB(0xf8f8f8)
#define kPersonHeader_Color [UIColor colorWithRGBHex:0x4dc8fe];

#define MenuBottomLine_Color UIColorFromRGB(0xb0b0b0)
#define DutyText_Color UIColorFromRGB(0x999999)
#define MenuText_Color UIColorFromRGB(0x333333)
#define DescText_Color UIColorFromRGB(0x666666)
#define OrgBG_Color UIColorFromRGB(0xffc54c)
#define PoolBG_Color UIColorFromRGB(0xff9400)
#define CellBG_Color UIColorFromRGB(0xf8f8f8)
#define MenuSeparator_Color UIColorFromRGB(0xf8f8f8)
#endif /* Colour_h */
