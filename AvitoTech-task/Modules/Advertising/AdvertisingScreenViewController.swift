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
    
    var collectionView = UICollectionView()
    
    
    var lastSelected: Bool?
    var selected: Bool?
    
    // MARK: - Private Properties
    private var banners: [Banner] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }


    // MARK: - Private Methods
    func setupCollectionView() {
        self.view.addSubview(collectionView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerReferenceSize = CGSize(width: (UIScreen.main.bounds.size.width - 20), height: 120)
        
    }
    
    
    
    
    
    // MARK: - UI Actions
    
}

extension AdvertisingScreenViewController: PresenterToViewAdvertisingScreenProtocol{
    func onFetchAdvertisingSuccess(banner: AdvertisingModel) {
        banners = banner.list
        collectionView.reloadData()
    }
    
    func onFetchAdvertisingFailure(error: String) {
        print(error)
    }
    
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
