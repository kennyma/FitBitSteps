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
		let requestURL = URL(string: "\(authURL)?client_id=\(clientID)&response_type=token&scope=activity&redirect_uri=\(callbackURI)")!
		
		UIApplication.shared.open(requestURL, options: [:], completionHandler: { (success) in })
	}
}

