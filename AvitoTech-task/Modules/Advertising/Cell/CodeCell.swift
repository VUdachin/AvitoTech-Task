//
//  CodeCell.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 13.02.2021.
//

import UIKit

class CodeCell: UICollectionViewCell {
    
    static var reuseIdentifier = "CodeCell"
    
    // MARK: - Create UI
    private lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.layer.cornerRadius = 20
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var checkmarkImageView: UIImageView = {
        let checkmark = UIImageView()
        checkmark.contentMode = .scaleAspectFill
        checkmark.layer.cornerRadius = 15
        checkmark.image = UIImage(systemName: "checkmark.circle.fill")
        checkmark.isHidden = true
        checkmark.translatesAutoresizingMaskIntoConstraints = false
        return checkmark
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupCell()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with ad: Banner) {
        priceLabel.text = ad.price
        titleLabel.text = ad.title
        descriptionLabel.text = ad.description
        iconImageView.downloadFrom(imageUrl: ad.icon.the52X52)
    }
    
    func changeState() {
        if checkmarkImageView.isHidden {
            checkmarkImageView.isHidden = false
        } else {
            checkmarkImageView.isHidden = true
        }
    }
    
    // MARK: - Setup UI
    private func setupSubViews() {
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 25
        contentView.addSubview(iconImageView)
        contentView.addSubview(checkmarkImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
    }
    
    private func setupCell() {
        setupSubViews()
        
        let inset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            
            iconImageView.heightAnchor.constraint(equalToConstant: 55),
            iconImageView.widthAnchor.constraint(equalToConstant: 55),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 25),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 25),
            checkmarkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            checkmarkImageView.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: checkmarkImageView.leadingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: checkmarkImageView.leadingAnchor, constant: -8),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset),
            
            priceLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            priceLabel.trailingAnchor.constraint(equalTo: checkmarkImageView.leadingAnchor, constant: -8),
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            
            contentView.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: inset),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20)
        ])
    }

}
