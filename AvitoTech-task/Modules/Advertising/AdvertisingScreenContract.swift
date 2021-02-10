//
//  AdvertisingScreenContract.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 04.02.2021.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol ViewOutputAdvertisingScreenProtocol: class {
    func onFetchAdvertisingSuccess(banner: AdvertisingModel)
    func onFetchAdvertisingFailure(error: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewInputAdvertisingScreenProtocol: class {
    
    var view: ViewOutputAdvertisingScreenProtocol? { get set }
    var interactor: InteractorAdvertisingScreenProtocol? { get set }
    var router: PresenterToRouterAdvertisingScreenProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol InteractorAdvertisingScreenProtocol: class {
    
    var presenter: PresenterAdvertisingScreenProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol PresenterAdvertisingScreenProtocol: class {
    func fetchAdvertisingSuccess(ad: AdvertisingModel)
    func fetchAdvertisingFailure(err: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAdvertisingScreenProtocol: class {
    
}

protocol AdvertisingScreenConfiguratorProtocol: class {
    func configure(with viewController: AdvertisingScreenViewController)
}


protocol AdvertisingScreenRouterProtocol: class {
    func closeCurrentViewController()
    func nextViewController()
}
