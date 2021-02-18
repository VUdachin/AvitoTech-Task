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
    
    var isLastSelected: Bool?
    var isSelected: Bool?
    
    // MARK: - Private Properties
    private var banners: [Banner] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        presenter?.setupView()
    }


    // MARK: - Private Methods
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 10)
        //layout.headerReferenceSize = CGSize(width: (UIScreen.main.bounds.size.width - 20), height: 120)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CodeCell.self, forCellWithReuseIdentifier: CodeCell.reuseIdentifier)
        self.view.addSubview(collectionView)
        
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.alwaysBounceVertical = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    // MARK: - UI Actions
    
}

extension AdvertisingScreenViewController: ViewOutputAdvertisingScreenProtocol {
    func onFetchAdvertisingSuccess(banner: AdvertisingModel) {
        print("View receives the response from Presenter and updates itself.")
        DispatchQueue.main.async {
            self.banners = banner.list
            self.collectionView.reloadData()
        }
    }
    
    func onFetchAdvertisingFailure(error: String) {
        print(error)
        print("View receives the response from Presenter and updates itself.")
    }
    
}

extension AdvertisingScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let banner = banners[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CodeCell.reuseIdentifier, for: indexPath) as? CodeCell else {
            fatalError("Could not instantiate AdvertViewCell.")
        }
        cell.backgroundColor = .systemGray2
        cell.layer.cornerRadius = 5
        cell.configure(with: banner)

        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdCell", for: indexPath) as? AdCell else {
//                    fatalError("Could not instantiate AdvertViewCell.")
//                }
//        let banner = banners[indexPath.item].isSelected
//        if banner {
//
//        }
//    }
    
}
