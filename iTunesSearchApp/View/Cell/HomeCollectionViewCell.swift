//
//  HomeCollectionViewCell.swift
//  iTunesSearchApp
//
//  Created by Mahmut Gazi Doğan on 22.03.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var artworkImage: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    

}
