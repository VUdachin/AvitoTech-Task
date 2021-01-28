//
//  AdViewCell.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 28.01.2021.
//

import UIKit

class AdCell: UICollectionViewCell {

    @IBOutlet weak var adIconInageView: UIImageView!
    @IBOutlet weak var checkmarkImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    let identifier = "AdCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(with data: Banner) {
        adIconInageView.downloadFrom(imageUrl: data.icon.the52X52)
        if data.isSelected {
            checkmarkImageView.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            checkmarkImageView.image = nil
        }
        
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        priceLabel.text = data.price
    }
    
}
