//
//  ViewController.m
//  FitBitSteps
//
//  Created by Daniel Hsu on 9/5/17.
//  Copyright © 2017 Mango. All rights reserved.
//

#import "ViewController.h"
#import "Globals.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)connectButtonTapped:(id)sender {
	NSURL* requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?client_id=%@&response_type=code&scope=activity&redirect_uri=%@", authURL, clientID, callbackURI]];
	[[UIApplication sharedApplication] openURL:requestURL options:@{} completionHandler:nil];
}


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
