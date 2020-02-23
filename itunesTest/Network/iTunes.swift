//
//  iTunes.swift
//  itunesTest
//
//  Created by Rodrigo Astorga on 19-02-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import Foundation
import Moya

public enum Itunes {
    case search(byString: String)
}

extension Itunes: TargetType {
    public var baseURL: URL {
        return URL(string: "https://itunes.apple.com")!
    }
    
    public var path: String {
        switch self {
        case .search: return "/search"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .search: return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .search(let searchString):
            return .requestParameters(parameters: ["term": searchString,
                                                   "mediaType": "music",
                                                   "limit": 20],
                                      encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
