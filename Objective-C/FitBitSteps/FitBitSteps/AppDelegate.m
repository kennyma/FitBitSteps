//
//  AppDelegate.m
//  FitBitSteps
//
//  Created by Daniel Hsu on 9/5/17.
//  Copyright © 2017 Mango. All rights reserved.
//

#import "AppDelegate.h"
#import "Globals.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
	
	if ([url.host isEqual: @"oauth-callback"]) {
		NSString* code = [NSURLComponents componentsWithString:url.absoluteString].queryItems.firstObject.value;
		if (!code) {
			dispatch_async(dispatch_get_main_queue(), ^{
				UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"There was an issue with your FitBit authentication. Please try again." preferredStyle:UIAlertControllerStyleAlert];
				[alert showViewController:self.window.rootViewController sender:nil];
			});
			
			return NO;
		}
		
		NSString* base64Secret = [[[NSString stringWithFormat:@"%@:%@", clientID, clientSecret] dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
		NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:tokenURL]];
		[request setHTTPMethod:@"POST"];
		[request setHTTPBody:[[NSData alloc] initWithBase64EncodedString:[NSString stringWithFormat:@"client_id=%@&gran_type=authorization_code&redirect_uri=%@&code=%@", clientID, callbackURI, code] options:0]];
		[request addValue:[NSString stringWithFormat:@"Basic %@", base64Secret] forHTTPHeaderField:@"Authorization"];
		
		NSURLSessionTask* task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
			NSError* serializationError;
			NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&serializationError];
			if (serializationError) {
				NSLog(@"JSON deserialization error");
				return;
			}
			if ([responseDict.allKeys containsObject:@"errors"]) {
				NSLog(@"Error: %@", responseDict[@"errors"]);
				return;
			}
			
			Globals.accessToken = responseDict[@"access_token"];
			Globals.userID = responseDict[@"user_id"];
		}];
		[task resume];
	}
	return YES;
}

@end
