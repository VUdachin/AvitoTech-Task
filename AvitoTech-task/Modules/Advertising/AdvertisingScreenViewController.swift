//
//  AdvertisingScreenViewController.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 04.02.2021.
//  
//

import UIKit

class AdvertisingScreenViewController: UIViewController {
 
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 6
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layoutIfNeeded()
        button.addTarget(self, action: #selector(selectedAlert), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Public Properties
    var presenter: ViewInputAdvertisingScreenProtocol?
    
    var collectionView: UICollectionView!
    
    var selectedIndex: IndexPath = IndexPath(item: 0, section: 0)
    
    // MARK: - Private Properties
    private var banners: AdvertisingModel?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        presenter?.setupView()
    }


    // MARK: - Private Methods
    
    @objc func selectedAlert() {
        let alert = UIAlertController(title: "Вы выбрали", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Готово", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
    func setupUI() {
        let safeArea = view.safeAreaLayoutGuide
        setupCollectionView()
        self.view.addSubview(collectionView)
        self.view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            //collectionView.bottomAnchor.constraint(equalTo: closeButton.topAnchor),
            
            closeButton.heightAnchor.constraint(equalToConstant: 60),
            closeButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15),
            closeButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            
            view.bottomAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 15)
        ])
    }
    
    private func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width - 30, height: 10)
        layout.headerReferenceSize = CGSize(width: (UIScreen.main.bounds.size.width - 30), height: 150)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.register(CodeCell.self, forCellWithReuseIdentifier: CodeCell.reuseIdentifier)
        collectionView.register(AdvertisingHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AdvertisingHeaderReusableView.reuseIdentifier)
        
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
            self.closeButton.setTitle(self.banners?.actionTitle, for: .normal)
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
        
        if selectedIndex.row == indexPath.row {
            cell.changeCheckmarkVisibility(isHidden: true)
        } else {
            cell.changeCheckmarkVisibility(isHidden: false)
        }

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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath
        collectionView.reloadData()
    }
    
}
