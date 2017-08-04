//
//  AppDelegate.swift
//  FitBit Steps
//
//  Created by Daniel Hsu on 7/18/17.
//  Copyright © 2017 Mango. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}

	func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
		if url.host == "oauth-callback" {
			guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first?.value else {
				DispatchQueue.main.async {
					let alert = UIAlertController(title: "Whoops!", message: "There was an issue with your FitBit authentication. Please try again.", preferredStyle: .alert)
					alert.show(self.window!.rootViewController!, sender: nil)
				}
				return false
			}
			
			let base64Secret = Data("\(clientID):\(clientSecret)".utf8).base64EncodedString()
			var request = URLRequest(url: URL(string: "\(tokenURL)")!)
			request.httpMethod = "POST"
			request.httpBody = "client_id=\(clientID)&grant_type=authorization_code&redirect_uri=\(callbackURI)&code=\(code)".data(using: .utf8)
			request.addValue("Basic \(base64Secret)", forHTTPHeaderField: "Authorization")
			
			let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
				if let responseDict = try? JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String, Any> {
					guard !responseDict.keys.contains("errors") else {
						print("Error: \(responseDict["errors"]!)")
						return
					}
					accessToken = responseDict["access_token"] as! String
				} else {
					print("JSON Serialization error")
				}
			}
			
			task.resume()
		}
		return true
	}
	
}

