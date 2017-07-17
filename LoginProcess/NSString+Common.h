//
//  NSString+Common.h
//  BrickMan
//
//  Created by duanyongrui on 16/7/21.
//  Copyright © 2016年 BrickMan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Common)

- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

+ (BOOL)isNULLString:(NSString *)string;
+ (BOOL)string:(NSString *)string subStr:(NSString *)subStr;
- (NSString *)md5Str;
+ (NSString*)convertToJSONData:(id)infoDict;
+ (NSString *)displayFileSize:(float)size;
/**
 字符串 解码
 
 @param input 编码过的字符串
 @return 解码字符串
 */
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input;

/**
 字符串 编码
 
 @param input 未编码过的字符串
 @return 编码字符串
 */
+ (NSString *)encodeToPercentEscapeString: (NSString *) input;
/**
 JSON字符串转化为字典
 
 @param jsonString JSON字符串
 @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
