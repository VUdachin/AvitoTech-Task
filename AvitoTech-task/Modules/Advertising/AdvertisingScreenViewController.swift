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
    var presenter: ViewInputAdvertisingScreenProtocol?
    
    var collectionView: UICollectionView!
    
    
    var lastSelected: Bool?
    var selected: Bool?
    
    // MARK: - Private Properties
    private var banners: [Banner] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        
    }


    // MARK: - Private Methods
    func setupCollectionView() {
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerReferenceSize = CGSize(width: (UIScreen.main.bounds.size.width - 20), height: 120)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(UINib(nibName: "AdCell", bundle: nil), forCellWithReuseIdentifier: "AdCell")
        self.view.addSubview(collectionView)
        
        
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //collectionView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 5).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 75, right: 0)
        collectionView.alwaysBounceVertical = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    
    
    
    
    // MARK: - UI Actions
    
}

extension AdvertisingScreenViewController: ViewOutputAdvertisingScreenProtocol {
    func onFetchAdvertisingSuccess(banner: AdvertisingModel) {
        DispatchQueue.main.async {
            self.banners = banner.list
            print(self.banners)
            self.collectionView.reloadData()
        }
        
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
