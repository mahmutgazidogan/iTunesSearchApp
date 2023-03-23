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
    case COUNTRY_PATH = "&country=us"
    case CALLBACK_PATH = "&callback=wsSearchCB"
    
    static func searchURL(query: String) -> String {
        return "\(BASE_URL.rawValue)\(TERM_PATH.rawValue)\(query)\(COUNTRY_PATH.rawValue)\(CALLBACK_PATH.rawValue)"
    }
    
}

protocol ITunesServiceProtocol {
    func search(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void)
}

struct ITunesService: ITunesServiceProtocol {
    
    func search(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void) {
        
//        var query = query.replacingOccurrences(of: " ", with: "+")
//        let urlString = ITunesAPI.searchURL + query.replacingOccurrences(of: " ", with: "+")
        
        let query = query.replacingOccurrences(of: " ", with: "+")
        let urlString = ITunesAPI.searchURL(query: query)
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
