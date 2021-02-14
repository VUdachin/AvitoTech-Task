//
//  AdvertisingScreenInteractor.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 04.02.2021.
//  
//

import Foundation

class AdvertisingScreenInteractor: InteractorAdvertisingScreenProtocol {

    // MARK: Properties
    var presenter: PresenterAdvertisingScreenProtocol?
    
    let url = URL(string: "https://raw.githubusercontent.com/avito-tech/internship/main/result.json")
    
    
    func fetchAdvertising() {
        guard let url = url else {
            return
        }
        
        NetworkWorker.shared.sendRequest(of: AdvertisingMessage.self, from: url, params: [:]) { (ads) in
            switch ads {
            case .success(let adv):
                self.presenter?.fetchAdvertisingSuccess(ad: adv.result)
            case .failure(let error):
                self.presenter?.fetchAdvertisingFailure(err: error.localizedDescription)
                print(error)
            }
        }
    }
}
