//
//  ITunesModel.swift
//  iTunesSearchApp
//
//  Created by Mahmut Gazi Doğan on 28.03.2023.
//

import Foundation

// MARK: - ITunesModel
struct ITunesModel: Codable {
    let resultCount: Int?
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let wrapperType: String?
    let kind: String?
    let collectionName: String?
    let artworkUrl100: String?
    let collectionPrice: Double?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType
        case kind
        case collectionName
        case artworkUrl100
        case collectionPrice
        case releaseDate
    }
}
