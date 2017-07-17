//
//  NSString+Common.m
//  BrickMan
//
//  Created by duanyongrui on 16/7/21.
//  Copyright © 2016年 BrickMan. All rights reserved.
//

#import "NSString+Common.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Common)

- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    return [self getSizeWithFont:font constrainedToSize:size].width;
}

- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    return [self getSizeWithFont:font constrainedToSize:size].height;
}

- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    CGSize resultSize = CGSizeZero;
    if (self.length <= 0) {
        return resultSize;
    }
    resultSize = [self boundingRectWithSize:size
                                    options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin)
                                 attributes:@{NSFontAttributeName: font}
                                    context:nil].size;
    resultSize = CGSizeMake(MIN(size.width, ceilf(resultSize.width)), MIN(size.height, ceilf(resultSize.height)));
    return resultSize;
}

+ (BOOL)isNULLString:(NSString *)string {
    return [@"" isEqualToString:string] || string == nil || string.length == 0 || [string isKindOfClass:[NSNull class]];
}

+ (BOOL)string:(NSString *)string subStr:(NSString *)subStr{
    if ([string rangeOfString:subStr].location != NSNotFound) {
        
        //条件为真，表示字符串string包含一个自字符串subStr
        return YES;
    }else{
        //条件为假，表示不包含要检查的字符串
        return NO ;
    }
}

- (NSString *)md5Str {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call

    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSString*)convertToJSONData:(id)infoDict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:infoDict
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    NSString *jsonString = @"";
    
    if (! jsonData)
    {
        NSLog(@"Got an error: %@", error);
    }else
    {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    
    [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return jsonString;
}

/**
 urlUrlDecode
 * 字符串 解码
 */
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
/**
 * url 字符串 编码
 */
+ (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    NSString* outputStr = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                       
                                                                                       NULL, /* allocator */
                                                                                       
                                                                                       (__bridge CFStringRef)input,
                                                                                       
                                                                                       NULL, /* charactersToLeaveUnescaped */
                                                                                       
                                                                                       (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                       
                                                                                       kCFStringEncodingUTF8);
    
    return outputStr;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (NSString *)displayFileSize:(float)size
{
    if (size<1024) {
        return [NSString stringWithFormat:@"%.1fB",size];
    }else if (1024<=size&&size<1024*1024){
        return [NSString stringWithFormat:@"%.1fKB",size/1024.f];
        
    }else{
        return [NSString stringWithFormat:@"%.1fMB",size/(1024*1024.f)];
    }
    
}

@end
