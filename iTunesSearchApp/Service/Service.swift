//
//  Service.swift
//  iTunesSearchApp
//
//  Created by Mahmut Gazi Doğan on 22.03.2023.
//

import Foundation
import Alamofire

enum ITunesAPI {
    
    static let searchURL = "https://itunes.apple.com/search?term="
    
}

protocol ITunesServiceProtocol {
    func search(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void)
}

struct ITunesService: ITunesServiceProtocol {
    
    func search(with query: String, onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void) {
        let query = query.replacingOccurrences(of: " ", with: "+")
        let urlString = ITunesAPI.searchURL + query
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
