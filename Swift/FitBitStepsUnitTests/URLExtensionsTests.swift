//
//  URLExtensionsTests.swift
//  FitBitSteps
//
//  Created by Kenny Ma on 8/28/17.
//  Copyright © 2017 Mango. All rights reserved.
//

import XCTest
@testable import FitBit_Steps

class URLExtensionsTests: XCTestCase {
    func testQueryStringValueOfShouldReturnValue() {
        let urlString = "mhsteptracker://oauth-callback?access_token=eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMjVCWksiLCJhdWQiOiIyMjhOUlIiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJyYWN0IiwiZXhwIjoxNTA0OTEzNDc1LCJpYXQiOjE1MDQ4MjcwOTV9.muu3aIprfppjaN7ymNVVplLj5-CMMTJFIF8OZUYwhTA&user_id=225BZK&scope=activity&token_type=Bearer&expires_in=86380"
        
        guard let url = URL(string: urlString) else {
            XCTAssert(false)
            return
        }
        
        let token = url.queryStringValueOf(queryStringName: "access_token")!
        let user_id = url.queryStringValueOf(queryStringName: "user_id")!
        let token_type = url.queryStringValueOf(queryStringName: "token_type")!
        let expires_in = url.queryStringValueOf(queryStringName: "expires_in")!
        
        XCTAssertEqual(token, "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMjVCWksiLCJhdWQiOiIyMjhOUlIiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJyYWN0IiwiZXhwIjoxNTA0OTEzNDc1LCJpYXQiOjE1MDQ4MjcwOTV9.muu3aIprfppjaN7ymNVVplLj5-CMMTJFIF8OZUYwhTA")
        XCTAssertEqual(user_id, "225BZK")
        XCTAssertEqual(token_type, "Bearer")
        XCTAssertEqual(expires_in, "86380")
    }
}
