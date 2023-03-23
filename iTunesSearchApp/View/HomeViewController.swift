//
//  HomeViewController.swift
//  iTunesSearchApp
//
//  Created by Mahmut Gazi Doğan on 22.03.2023.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    private let searcher = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        createSearchBar()
    }
    
    private func setupUI() {
        title = "iTunes"
        collectionView.delegate = self
        collectionView.dataSource = self
        /// cv reload ?
    }
    
    private func createSearchBar() {
        navigationItem.searchController = searcher
        searcher.searchBar.delegate = self
        searcher.searchBar.placeholder = "Search something..."
    }
    
    
    
    
    @IBAction func segmentedControlChanging(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Movies selected")
        case 1:
            print("Music selected")
        case 2:
            print("Apps selected")
        case 3:
            print("Books selected")
        default:
            return
        }
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        print(text)
    }
}
