//
//  AdViewCell.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 28.01.2021.
//

import UIKit

class AdViewCell: UICollectionViewCell {

    @IBOutlet weak var adIconInageView: UIImageView!
    @IBOutlet weak var checkmarkImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
