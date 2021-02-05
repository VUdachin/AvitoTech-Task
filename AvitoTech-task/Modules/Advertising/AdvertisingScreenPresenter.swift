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
    var view: PresenterToViewAdvertisingScreenProtocol?
    var interactor: PresenterToInteractorAdvertisingScreenProtocol?
    var router: PresenterToRouterAdvertisingScreenProtocol?
}

extension AdvertisingScreenPresenter: InteractorToPresenterAdvertisingScreenProtocol {
    
}
