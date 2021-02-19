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
    private var banners: AdvertisingModel?
    
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
        layout.headerReferenceSize = CGSize(width: (UIScreen.main.bounds.size.width), height: 150)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CodeCell.self, forCellWithReuseIdentifier: CodeCell.reuseIdentifier)
        collectionView.register(AdvertisingHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AdvertisingHeaderReusableView.reuseIdentifier)
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
            self.banners = banner
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
        return banners?.list.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CodeCell.reuseIdentifier, for: indexPath) as? CodeCell,
              let banner = banners?.list[indexPath.item] else {
            fatalError("Could not instantiate CodeCell.")
        }
        cell.backgroundColor = .systemGray2
        cell.layer.cornerRadius = 5
        cell.configure(with: banner)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AdvertisingHeaderReusableView.reuseIdentifier, for: indexPath) as? AdvertisingHeaderReusableView else {
            fatalError("Could not instantiate Header.")
        }
        headerView.backgroundColor = .white
        headerView.configure(with: banners)
        return headerView
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
