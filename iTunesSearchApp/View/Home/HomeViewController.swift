//
//  HomeViewController.swift
//  iTunesSearchApp
//
//  Created by Mahmut Gazi Doğan on 22.03.2023.
//

import UIKit
import Kingfisher

protocol ITunesOutput {
    func saveDatas()
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var homeViewModel: HomeViewModelProtocol = HomeViewModel()
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
    }
    
    private func createSearchBar() {
        navigationItem.searchController = searcher
        searcher.searchBar.delegate = self
        searcher.searchBar.placeholder = "Search something..."
    }
    
    @IBAction func segmentedControlChanging(_ sender: UISegmentedControl) {
        collectionView.reloadData()
        collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0: return homeViewModel.movieList.count
        case 1: return homeViewModel.musicList.count
        case 2: return homeViewModel.appList.count
        case 3: return homeViewModel.bookList.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "DetailsStoryboard", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailsViewController
        switch segmentedControl.selectedSegmentIndex {
        case 0: detailVC.detailsList = homeViewModel.movieList[indexPath.row]
        case 1: detailVC.detailsList = homeViewModel.musicList[indexPath.row]
        case 2: detailVC.detailsList = homeViewModel.appList[indexPath.row]
        case 3: detailVC.detailsList = homeViewModel.bookList[indexPath.row]
        default: break
        }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        switch segmentedControl.selectedSegmentIndex {
        case 0: cell.saveModel(model: homeViewModel.movieList[indexPath.row])
        case 1: cell.saveModel(model: homeViewModel.musicList[indexPath.row])
        case 2: cell.saveModel(model: homeViewModel.appList[indexPath.row])
        case 3: cell.saveModel(model: homeViewModel.bookList[indexPath.row])
        default: break
        }
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        homeViewModel.fetchMusic(searchTerm: text)
        homeViewModel.fetchMovie(searchTerm: text)
        homeViewModel.fetchAPP(searchTerm: text)
        homeViewModel.fetchBook(searchTerm: text)
        homeViewModel.itunesOutput?.saveDatas()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        homeViewModel.movieList.removeAll()
        homeViewModel.musicList.removeAll()
        homeViewModel.appList.removeAll()
        homeViewModel.bookList.removeAll()
        saveDatas()
    }
}

extension HomeViewController: ITunesOutput {
    func saveDatas() {
        self.collectionView.reloadData()
    }
}
