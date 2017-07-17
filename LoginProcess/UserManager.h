//
//  UserManager.h
//  BaseProject-OC
//
//  Created by 凤云鹏 on 2017/3/21.
//  Copyright © 2017年 FYP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "User.h"


@interface UserManager : NSObject
singleton_h(UserManager)
/** 全局用户数据 */
@property (nonatomic, strong) User *user;
/** 记住密码 */
@property (nonatomic, assign) BOOL isRember;

@property (nonatomic, strong) NSString *lastLoginUser;

/*********** 敏感用户信息 **********/

/*
 * 保存账号密码
 */
- (BOOL)savePassword:(NSString *)password account:(NSString *)account;
/*
 * 获取账号密码
 */
- (NSString *)getPasswordForAccount:(NSString *)account;
/*
 * 删除账号密码
 */
- (BOOL)deleteAccount:(NSString *)account;

- (NSArray *)allAccount;

//********* 基本用户信息缓存 *********/
/**
 *  归档 - 存入模型
 */
- (void)archive;

/**
 *  解档 - 取出模型
 */
- (id)unarchiver;

/**
 *  移除缓存中的模型
 */
- (void)remove;
@end
