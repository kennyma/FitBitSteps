//
//  Globals.h
//  FitBitSteps
//
//  Created by Daniel Hsu on 9/5/17.
//  Copyright © 2017 Mango. All rights reserved.
//

#define authURL @"https://www.fitbit.com/oauth2/authorize"
#define callbackURI @"mhStepTracker://oauth-callback"
#define tokenURL @"https://api.fitbit.com/oauth2/token"
#define clientSecret @"45d700afa2244b04fc30f26b205eeb8b"
#define clientID @"228NRR"
#define kSupportURL @"https://support.mangohealth.com"

#import <Foundation/Foundation.h>

@interface Globals : NSObject

+ (NSString*) accessToken;
+ (void) setAccessToken:(NSString *)accessToken;
+ (NSString*) userID;
+ (void) setUserID:(NSString *)userID;

@end
