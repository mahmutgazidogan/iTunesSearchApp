//
//  HomeViewModel.swift
//  iTunesSearchApp
//
//  Created by Mahmut Gazi Doğan on 23.03.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    func makeSearch(searchTerm: String)
    
    var dataList: [Result] { get set }
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var dataList: [Result] = []
    private(set) var itunesService: ITunesServiceProtocol
    
    init() {
        itunesService = ITunesService()
    }
    
    func makeSearch(searchTerm: String) {
        itunesService.search(with: searchTerm) { [weak self] (model) in
            self?.dataList = model
        } onFail: { error in
            print(error)
        }
    }
    
}
