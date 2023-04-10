//
//  DetailsViewController.swift
//  iTunesSearchApp
//
//  Created by Mahmut Gazi Doğan on 7.04.2023.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var artworkImage: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var detailsList: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        
        scrollView.delegate = self
        artworkImage.layer.cornerRadius = 10.0
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let result = dateFormatter.date(from: detailsList?.releaseDate ?? "")
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let convertedDate = dateFormatter.string(from: result ?? Date())
             
        artworkImage.kf.setImage(with: URL(string: detailsList?.artworkUrl100 ?? ""))
        collectionNameLabel.text = detailsList?.collectionName ?? detailsList?.trackName
        priceLabel.text = "Price: \(detailsList?.collectionPrice ?? Double()) \(detailsList?.currency ?? "")"
        artistNameLabel.text = detailsList?.artistName
        dateLabel.text = "Release Date: \(convertedDate)"
        
        if detailsList?.description != nil || detailsList?.longDescription != nil {
            descriptionLabel.text = detailsList?.description ?? detailsList?.longDescription
        } else {
            descriptionLabel.text = "Description has not found!"
        }
        
    }

}

extension DetailsViewController: UIScrollViewDelegate { }
