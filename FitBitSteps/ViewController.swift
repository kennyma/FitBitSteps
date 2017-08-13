//
//  ViewController.swift
//  FitBit Steps
//
//  Created by Daniel Hsu on 7/18/17.
//  Copyright © 2017 Mango. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var connectButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		connectButton.layer.cornerRadius = 2.0
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBAction func connectButtonTapped(_ sender: UIButton) {
		let requestURL = URL(string: "\(authURL)?client_id=\(clientID)&response_type=code&scope=activity&redirect_uri=\(callbackURI)")!
		
//        let appDelegate = UIApplication.shared.delegate
        
        
		UIApplication.shared.open(requestURL, options: [:], completionHandler: { (success) in
            if success {
//                let stepsRequestString  = "https://api.fitbit.com/1/user/\(clientID)/activities/steps/date/today/1d.json"
//                let stepsRequestURL = URL.init(string: stepsRequestString)
//                var stepsRequest = URLRequest.init(url: stepsRequestURL!)
//                stepsRequest.addValue(accessToken, forHTTPHeaderField: "Authorization")
//
//                let task = URLSession.shared.dataTask(with: stepsRequestURL!) { (data, response, error) in
//                    if let responseDict = try? JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String, Any> {
//                        stepsData = responseDict
//
//                    } else {
//                        print("JSON Serialization error")
//                    }
//                }
//                
//                task.resume()
            }
            
        })
	}

}

