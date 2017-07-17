//
//  User.h
//  BaseProject-OC
//
//  Created by 凤云鹏 on 2017/3/21.
//  Copyright © 2017年 FYP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>


/** 用户编号 */
@property (nonatomic, assign) NSString *userNo;

/** 用户名字 */
@property (nonatomic, strong) NSString *name;

/** 票据 */
@property (nonatomic, strong) NSString *ticket;

+(id)initWithDictionary:(NSDictionary *)dic;
@end
