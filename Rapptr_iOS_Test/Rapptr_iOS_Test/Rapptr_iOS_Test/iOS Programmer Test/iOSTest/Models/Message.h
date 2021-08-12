//
//  Message.h
//  iOSTest
//
//  Created by D & A Technologies on 9/23/16.
//  Copyright © 2018 D & A Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSURL *avatarURL;
@property (nonatomic, strong) NSString *text;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithTestName:(NSString *)name withTestMessage:(NSString *)message;
@end
