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
    let artistName: String?
    let collectionName: String?
    let artworkUrl100: String?
    let collectionPrice: Double?
    let releaseDate: String?
    let currency: String?
    let longDescription: String?
    let price: Double?
    let description: String?
    let trackName: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType
        case kind
        case artistName
        case collectionName
        case artworkUrl100
        case collectionPrice
        case releaseDate
        case currency
        case longDescription
        case price
        case description
        case trackName
    }
}
