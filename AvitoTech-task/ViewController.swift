//
//  ViewController.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 28.01.2021.
//

import UIKit

class ViewController: UIViewController {

    let data = ["String"]
    let collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func setupCollectionView() {
        collectionView.register(UINib(nibName: "AdCell", bundle: nil), forCellWithReuseIdentifier: "AdCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdCell", for: indexPath) as! AdCell
        return cell
    }
    
    
}
