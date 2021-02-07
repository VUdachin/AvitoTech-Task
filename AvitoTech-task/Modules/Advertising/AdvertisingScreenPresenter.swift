//
//  AdvertisingScreenPresenter.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 04.02.2021.
//  
//

import Foundation

class AdvertisingScreenPresenter: ViewToPresenterAdvertisingScreenProtocol {

    // MARK: Properties
    weak var view: PresenterToViewAdvertisingScreenProtocol?
    var interactor: PresenterToInteractorAdvertisingScreenProtocol?
    var router: PresenterToRouterAdvertisingScreenProtocol?
}

extension AdvertisingScreenPresenter: InteractorToPresenterAdvertisingScreenProtocol {
    func fetchAdvertisingSuccess(ad: AdvertisingModel) {
        view?.onFetchAdvertisingSuccess(banner: ad)
    }
    
    func fetchAdvertisingFailure(err: String) {
        view?.onFetchAdvertisingFailure(error: err)
    }
}
