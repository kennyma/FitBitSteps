//
//  URLHelper.swift
//  FitBitSteps
//
//  Created by Kenny Ma on 8/28/17.
//  Copyright © 2017 Mango. All rights reserved.
//

import Foundation

extension URL {
    public func queryStringValueOf(queryStringName: String) -> String? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return nil }
        return components.queryItems?.first(where: { $0.name == queryStringName })?.value
    }
}
