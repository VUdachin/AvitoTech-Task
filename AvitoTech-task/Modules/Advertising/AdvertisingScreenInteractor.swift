//
//  AdvertisingScreenInteractor.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 04.02.2021.
//  
//

import Foundation

class AdvertisingScreenInteractor: PresenterToInteractorAdvertisingScreenProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterAdvertisingScreenProtocol?
    
    let url = URL(string: "https://github.com/avito-tech/internship/blob/main/result.json")
    
    
    func fetchAdvertising(completion: @escaping (AdvertisingMessage) -> Void) {
        guard let url = url else {
            return
        }
        
        NetworkWorker.shared.sendRequest(of: AdvertisingMessage.self, from: url, params: [:]) { (ads) in
            switch ads {
            case .success(let result):
                completion(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}