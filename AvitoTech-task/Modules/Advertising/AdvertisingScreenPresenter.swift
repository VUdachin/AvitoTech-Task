//
//  AdvertisingScreenPresenter.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 04.02.2021.
//  
//

import Foundation

class AdvertisingScreenPresenter: ViewInputAdvertisingScreenProtocol {

    // MARK: Properties
    weak var view: ViewOutputAdvertisingScreenProtocol?
    var interactor: InteractorAdvertisingScreenProtocol?
    var router: PresenterToRouterAdvertisingScreenProtocol?
}

extension AdvertisingScreenPresenter: PresenterAdvertisingScreenProtocol {
    func fetchAdvertisingSuccess(ad: AdvertisingModel) {
        view?.onFetchAdvertisingSuccess(banner: ad)
    }
    
    func fetchAdvertisingFailure(err: String) {
        view?.onFetchAdvertisingFailure(error: err)
    }
}
