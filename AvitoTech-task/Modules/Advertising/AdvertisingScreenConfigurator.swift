//
//  AdvertisingScreenConfigurator.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 10.02.2021.
//

import Foundation


class AdvertisingScreenConfigurator: AdvertisingScreenConfiguratorProtocol {
    
    func configure(with viewController: AdvertisingScreenViewController) {
        let presenter = AdvertisingScreenPresenter()
        let interactor = AdvertisingScreenInteractor()
        let router = AdvertisingScreenRouter()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
    }
    
}
