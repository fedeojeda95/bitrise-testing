//
//  StubManager.swift
//  Movy-iosTests
//
//  Created by Fernando de la Fuente on 6/24/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import Foundation
import Hippolyte
@testable import Movy_ios

class StubManager {
    static func createStubWithSuccessJsonResponse(
        url: String,
        httpMethod: HTTPMethod,
        jsonResponseFileName: String
    ) -> StubRequest? {

        guard
            let regex = try? NSRegularExpression(pattern: "\(url)+", options: [])
        else { return nil }

        var stub = StubRequest(method: httpMethod, urlMatcher: RegexMatcher(regex: regex))
        var response = StubResponse()

        guard
            let path = Bundle(for: StubManager.self).path(forResource: jsonResponseFileName, ofType: "json")
        else { return nil }

        let data = NSData(contentsOfFile: path)!
        let body = data
        response.body = body as Data
        stub.response = response

        return stub
    }

    static func createStubWithErrorResponse(url: String, httpMethod: HTTPMethod, errorCode: Int) -> StubRequest? {
        guard
            let regex = try? NSRegularExpression(pattern: "\(url)+", options: [])
        else { return nil }

        var stub = StubRequest(method: httpMethod, urlMatcher: RegexMatcher(regex: regex))
        let errorResponse = NSError(domain: "Error response", code: errorCode, userInfo: [:])
        let response = StubResponse(error: errorResponse)
        stub.response = response

        return stub
    }
}
