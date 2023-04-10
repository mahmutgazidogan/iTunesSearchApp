//
//  HomeViewModel.swift
//  iTunesSearchApp
//
//  Created by Mahmut Gazi Doğan on 23.03.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    func fetchMusic(searchTerm: String)
    func fetchMovie(searchTerm: String)
    func fetchAPP(searchTerm: String)
    func fetchBook(searchTerm: String)
    func setDelegate(output: ITunesOutput)
    
    var itunesOutput: ITunesOutput? { get }
    var movieList: [Result] { get set }
    var musicList: [Result] { get set }
    var appList: [Result] { get set }
    var bookList: [Result] { get set }
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var itunesOutput: ITunesOutput?
    var movieList: [Result] = []
    var musicList: [Result] = []
    var appList: [Result] = []
    var bookList: [Result] = []
    
    private(set) var itunesService: ITunesServiceProtocol
    
    init() {
        itunesService = ITunesService()
    }
    
    func fetchMovie(searchTerm: String) {
        itunesService.fetchMovie(with: searchTerm) { [weak self] (model) in
            self?.movieList = model
        } onFail: { error in
            print(error)
        }

    }
    
    func fetchMusic(searchTerm: String) {
        itunesService.fetchMusic(with: searchTerm) { [weak self] (model) in
            self?.musicList = model
        } onFail: { error in
            print(error)
        }
    }
    
    func fetchAPP(searchTerm: String) {
        itunesService.fetchAPP(with: searchTerm) { [weak self] (model) in
            self?.appList = model
        } onFail: { error in
            print(error)
        }
    }
    
    func fetchBook(searchTerm: String) {
        itunesService.fetchBook(with: searchTerm) { [weak self] (model) in
            self?.bookList = model
        } onFail: { error in
            print(error)
        }
    }

    func setDelegate(output: ITunesOutput) {
        itunesOutput = output
    }
    
}
