//
//  NetworkRouter.swift
//  chatwoot
//
//  Created by shamzz on 21/09/21.
//

import Foundation

protocol Router {
    var asURL: URL { get }
    var path: String { get }
    var method: String { get }
    func asURLRequest() throws -> URLRequest
}

extension Router {
    var baseURL: URL {
        ServerConfig().baseURL
    }
}

extension URLRequest {
    
    mutating func setAuthorizationHeader() {
        if GetUserDefaults.authToken != "" {
            setValue("Bearer \(GetUserDefaults.authToken)", forHTTPHeaderField: "Authorization")
            addValue(GetUserDefaults.authToken , forHTTPHeaderField: "sessionId")
        }
    }
}
