//
//  AdvertisingScreenViewController.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 04.02.2021.
//  
//

import UIKit

class AdvertisingScreenViewController: UIViewController {
 
    // MARK: - Public Properties
    var presenter: ViewToPresenterAdvertisingScreenProtocol?
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.register(UINib(nibName: "AdCell", bundle: nil), forCellWithReuseIdentifier: "AdCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
        return collectionView
    }()
    
    
    var lastSelected: Bool?
    var selected: Bool?
    
    // MARK: - Private Properties
    let banners: [Banner] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    // MARK: - Private Methods

    
    // MARK: - UI Actions
    
}

extension AdvertisingScreenViewController: PresenterToViewAdvertisingScreenProtocol{
    // TODO: Implement View Output Methods
}

extension AdvertisingScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let banner = banners[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdCell", for: indexPath) as! AdCell
        cell.configureCell(with: banner)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
