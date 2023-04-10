//
//  Service.swift
//  iTunesSearchApp
//
//  Created by Mahmut Gazi Doğan on 22.03.2023.
//

import Foundation
import Alamofire

enum ITunesAPI: String {
    
    case BASE_URL = "https://itunes.apple.com/search?"
    case TERM_PATH = "term="
    case MUSIC_PATH = "&media=music"
    case MOVIE_PATH = "&media=movie"
    case APP_PATH = "&entity=software"
    case BOOK_PATH = "&media=ebook"
    case LIMIT_PATH = "&limit=200"
    case COUNTRY_PATH = "&country=us"
    
    static func movieURL(query: String) -> String {
        return "\(BASE_URL.rawValue)\(TERM_PATH.rawValue)\(query)\(MOVIE_PATH.rawValue)\(LIMIT_PATH.rawValue)\(COUNTRY_PATH.rawValue)"
    }
    
    static func musicURL(query: String) -> String {
        return "\(BASE_URL.rawValue)\(TERM_PATH.rawValue)\(query)\(MUSIC_PATH.rawValue)\(LIMIT_PATH.rawValue)\(COUNTRY_PATH.rawValue)"
    }
    
    static func appURL(query: String) -> String {
        return "\(BASE_URL.rawValue)\(TERM_PATH.rawValue)\(query)\(COUNTRY_PATH.rawValue)\(APP_PATH.rawValue)"
    }
    
    static func bookURL(query: String) -> String {
        return "\(BASE_URL.rawValue)\(TERM_PATH.rawValue)\(query)\(BOOK_PATH.rawValue)\(LIMIT_PATH.rawValue)\(COUNTRY_PATH.rawValue)"
    }
    
}

protocol ITunesServiceProtocol {
    func fetchMovie(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void)
    func fetchMusic(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void)
    func fetchAPP(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void)
    func fetchBook(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void)
}

struct ITunesService: ITunesServiceProtocol {
    
    func fetchMovie(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void) {
        let query = query.replacingOccurrences(of: " ", with: "+")
        let urlString = ITunesAPI.movieURL(query: query)
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        AF.request(url, method: .get).responseDecodable(of: ITunesModel.self) { (response) in
            guard let datas = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(datas.results)
        }
    }
    
    func fetchMusic(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void) {
        
        let query = query.replacingOccurrences(of: " ", with: "+")
        let urlString = ITunesAPI.musicURL(query: query)
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        AF.request(url, method: .get).responseDecodable(of: ITunesModel.self) { (response) in
            guard let datas = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(datas.results)
        }
    }
    
    func fetchAPP(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void) {
        let query = query.replacingOccurrences(of: " ", with: "+")
        let urlString = ITunesAPI.appURL(query: query)
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        AF.request(url, method: .get).responseDecodable(of: ITunesModel.self) { (response) in
            guard let datas = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(datas.results)
        }
    }
    
    func fetchBook(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void) {
        let query = query.replacingOccurrences(of: " ", with: "+")
        let urlString = ITunesAPI.bookURL(query: query)
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        AF.request(url, method: .get).responseDecodable(of: ITunesModel.self) { (response) in
            guard let datas = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(datas.results)
        }
    }
    
}
