//
//  User.m
//  BaseProject-OC
//
//  Created by 凤云鹏 on 2017/3/21.
//  Copyright © 2017年 FYP. All rights reserved.
//

#import "User.h"

@implementation User

#pragma mark- NSCoding


+(id)initWithDictionary:(NSDictionary *)dic
{
    User *user = [[User alloc] init];
    user.userNo = dic[@"userNo"];
    user.name = dic[@"name"];
    user.ticket = dic[@"ticket"];
    return user;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _userNo = [aDecoder decodeObjectForKey:@"userNo"];
        _name = [aDecoder decodeObjectForKey:@"name"];
        _ticket = [aDecoder decodeObjectForKey:@"ticket"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.userNo forKey:@"userNo"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.ticket forKey:@"ticket"];
}

@end
