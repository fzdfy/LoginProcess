//
//  UserManager.m
//  BaseProject-OC
//
//  Created by 凤云鹏 on 2017/3/21.
//  Copyright © 2017年 FYP. All rights reserved.
//

#import "UserManager.h"
#import "CacheManager.h"
#import "SAMKeychain.h"

static NSString * const KEY_IN_KEYCHAIN = @"com.loginProcess.app.userinfo";

@implementation UserManager
singleton_m(UserManager)



- (BOOL)isRember {
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"remember"];
}

- (void)setIsRember:(BOOL)isRember {
    [[NSUserDefaults standardUserDefaults] setBool:isRember forKey:@"remember"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)lastLoginUser {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"lastLoginUser"];
}

- (void)setLastLoginUser:(NSString *)lastLoginUser {
    [[NSUserDefaults standardUserDefaults] setObject:lastLoginUser forKey:@"lastLoginUser"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//
- (BOOL)savePassword:(NSString *)password account:(NSString *)account
{
    return  [SAMKeychain setPassword:password forService:KEY_IN_KEYCHAIN account:account];
}

- (NSString *)getPasswordForAccount:(NSString *)account
{
    return [SAMKeychain passwordForService:KEY_IN_KEYCHAIN account:account];
}

- (BOOL)deleteAccount:(NSString *)account
{
    return [SAMKeychain deletePasswordForService:KEY_IN_KEYCHAIN account:account];
}

- (NSArray *)allAccount
{
    return [SAMKeychain allAccounts];
}

//
- (id)unarchiver {
    id obj = [CacheManager getObjectByFileName:[self.class description]];
    return obj;
}

- (void)archive {
    [CacheManager saveObject:self.user byFileName:[self.class description]];
}

- (void)remove {
    [CacheManager removeObjectByFileName:[self.class description]];
}

@end
