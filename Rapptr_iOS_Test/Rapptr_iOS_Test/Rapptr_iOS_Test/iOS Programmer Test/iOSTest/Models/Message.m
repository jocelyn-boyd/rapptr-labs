//
//  Message.m
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

#import "Message.h"

@implementation Message

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        self.userID = dictionary[@"user_id"];
        self.username = dictionary[@"username"];
        self.avatarURL = [NSURL URLWithString:dictionary[@"avatar_url"]];
        self.text = dictionary[@"message"];
    }
    
    return self;
}

- (instancetype)initWithTestName:(NSString *)name withTestMessage:(NSString *)message
{
    self = [super init];
    if (self)
    {
        self.userID = 0;
        self.username = name;
        self.avatarURL = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/220px-Smiley.svg.png"];
        self.text = message;
    }
    
    return self;
}

@end
