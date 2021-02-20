//
//  AdvertisingHeaderReusableView.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 19.02.2021.
//

import UIKit

class AdvertisingHeaderReusableView: UICollectionReusableView {
    
    static var reuseIdentifier = "AdvertisingHeader"
        
    private lazy var closebutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isUserInteractionEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var adViewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = .max
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func closeButtonTouched() {
        print("It's touched")
    }
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupHeaderView()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with ad: AdvertisingModel?) {
        adViewLabel.text = ad?.title
    }
    
    
    private func setupSubviews() {
        addSubview(closebutton)
        addSubview(adViewLabel)
    }
    
    private func setupHeaderView() {
        setupSubviews()
        
        let inset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            
            closebutton.heightAnchor.constraint(equalToConstant: 30),
            closebutton.widthAnchor.constraint(equalToConstant: 30),
            closebutton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset),
            closebutton.topAnchor.constraint(equalTo: self.topAnchor, constant: inset),
            
            adViewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset),
            adViewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: inset),
            adViewLabel.topAnchor.constraint(equalTo: closebutton.topAnchor, constant: 25),
            adViewLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: inset)
        ])
    }
}
