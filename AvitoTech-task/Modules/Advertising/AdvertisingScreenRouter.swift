//
//  AdvertisingScreenRouter.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 04.02.2021.
//  
//

import Foundation
import UIKit

class AdvertisingScreenRouter: PresenterToRouterAdvertisingScreenProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = AdvertisingScreenViewController()
        
        let presenter: ViewToPresenterAdvertisingScreenProtocol & InteractorToPresenterAdvertisingScreenProtocol = AdvertisingScreenPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AdvertisingScreenRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AdvertisingScreenInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
