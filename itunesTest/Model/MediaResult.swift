//
//  MediaResult.swift
//  itunesTest
//
//  Created by Rodrigo Astorga on 19-02-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import Foundation

struct MediaResult: Codable {
    let wrapperType: String?
    let kind: String?
    let artistId: Int?
    let collectionId: Int?
    let trackId: Int?
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewUrl: URL?
    let collectionViewUrl: URL?
    let trackViewUrl: URL?
    let previewUrl: URL?
    let artworkUrl30: URL?
    let artworkUrl60: URL?
    let artworkUrl100: URL?
    let collectionPrice: Double?
    let trackPrice: Double?
    let collectionHdPrice: Double?
    let trackHdPrice: Double?
    let releaseDate: String?
    let collectionExplicitness: String?
    let trackExplicitness: String?
    let discCount: Int?
    let discNumber: Int?
    let trackCount: Int?
    let trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let contentAdvisoryRating: String?
    let shortDescription: String?
    let longDescription: String?
    let isStreamable: Bool?
}
