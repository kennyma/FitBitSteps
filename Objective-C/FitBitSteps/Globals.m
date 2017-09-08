//
//  Globals.m
//  FitBitSteps
//
//  Created by Daniel Hsu on 9/5/17.
//  Copyright © 2017 Mango. All rights reserved.
//

#import "Globals.h"

@implementation Globals

static NSString* _accessToken;
static NSString* _userID;

+ (NSString*) accessToken {
	return _accessToken;
}

+ (void) setAccessToken:(NSString *)accessToken {
	_accessToken = accessToken;
}

+ (NSString*) userID {
	return _userID;
}

+ (void) setUserID:(NSString *)userID {
	_userID = userID;
}

@end
