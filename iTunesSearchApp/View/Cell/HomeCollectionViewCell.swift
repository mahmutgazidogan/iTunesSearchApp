//
//  HomeCollectionViewCell.swift
//  iTunesSearchApp
//
//  Created by Mahmut Gazi Doğan on 22.03.2023.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var artworkImage: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func saveModel(model: Result) {
        
        guard let artworkUrl100 = model.artworkUrl100 else {
            self.artworkImage.kf.setImage(with: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/No_picture_available.png/401px-No_picture_available.png"))
            return
        }
        
        artworkImage.layer.cornerRadius = 10.0
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let result = dateFormatter.date(from: model.releaseDate ?? String())
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let convertedDate = dateFormatter.string(from: result ?? Date())
        
        switch model.kind {
            
        case .some("feature-movie"):
            self.artworkImage.kf.setImage(with: URL(string: artworkUrl100))
            self.collectionNameLabel.text = model.collectionName
            self.priceLabel.text = "\(model.collectionPrice ?? Double()) \(model.currency ?? "")"
            self.dateLabel.text = convertedDate
            
        case .some("song"):
            self.artworkImage.kf.setImage(with: URL(string: artworkUrl100))
            self.collectionNameLabel.text = model.collectionName
            self.priceLabel.text = "\(model.collectionPrice ?? Double()) \(model.currency ?? "")"
            self.dateLabel.text = convertedDate
            
        case .some("software"):
            self.artworkImage.kf.setImage(with: URL(string: artworkUrl100))
            self.collectionNameLabel.text = model.trackName
            self.priceLabel.text = "\(model.price ?? Double()) \(model.currency ?? "")"
            self.dateLabel.text = convertedDate
            
        case .some("ebook"):
            self.artworkImage.kf.setImage(with: URL(string: artworkUrl100))
            self.collectionNameLabel.text = model.trackName
            self.priceLabel.text = "\(model.price ?? Double()) \(model.currency ?? "")"
            self.dateLabel.text = convertedDate
            
        default: break
            
        }

    }
    
}
