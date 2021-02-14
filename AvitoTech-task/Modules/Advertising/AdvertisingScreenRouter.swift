//
//  AdvertisingScreenRouter.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 04.02.2021.
//  
//

import Foundation
import UIKit

class AdvertisingScreenRouter: RouterAdvertisingScreenProtocol {
    
    static func createModule() -> UIViewController {

        let viewController = AdvertisingScreenViewController()
        let presenter: ViewInputAdvertisingScreenProtocol & PresenterAdvertisingScreenProtocol = AdvertisingScreenPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AdvertisingScreenRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AdvertisingScreenInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
