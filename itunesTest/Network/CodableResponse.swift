//
//  CodableResponse.swift
//  itunesTest
//
//  Created by Rodrigo Astorga on 19-02-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import Foundation

struct ItunesResponse<T: Codable>: Codable {
    let resultCount: Int
    let results: [T] //ItunesResults<T>
}

struct ItunesResults<T: Codable>: Codable {
    let results: [T]
}

struct ImgurResponse<T: Codable>: Codable {
    let data: T
}
