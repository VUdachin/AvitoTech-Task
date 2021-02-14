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
    var router: RouterAdvertisingScreenProtocol?
    
    func setupView() {
        print("Presenter is being notified that the View was loaded.")
        interactor?.fetchAdvertising()
    }
}

extension AdvertisingScreenPresenter: PresenterAdvertisingScreenProtocol {
    func fetchAdvertisingSuccess(ad: AdvertisingModel) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.onFetchAdvertisingSuccess(banner: ad)
    }
    
    func fetchAdvertisingFailure(err: String) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.onFetchAdvertisingFailure(error: err)
    }
}
