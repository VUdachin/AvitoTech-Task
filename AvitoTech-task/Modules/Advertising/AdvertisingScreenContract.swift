//
//  AdvertisingScreenContract.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 04.02.2021.
//  
//

import Foundation
import UIKit


// MARK: View Output (Presenter -> View)
protocol ViewOutputAdvertisingScreenProtocol: class {
    func onFetchAdvertisingSuccess(banner: AdvertisingModel)
    func onFetchAdvertisingFailure(error: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewInputAdvertisingScreenProtocol: class {
    var view: ViewOutputAdvertisingScreenProtocol? { get set }
    var interactor: InteractorAdvertisingScreenProtocol? { get set }
    var router: RouterAdvertisingScreenProtocol? { get set }
    func setupView()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol InteractorAdvertisingScreenProtocol: class {
    var presenter: PresenterAdvertisingScreenProtocol? { get set }
    func fetchAdvertising()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol PresenterAdvertisingScreenProtocol: class {
    func fetchAdvertisingSuccess(ad: AdvertisingModel)
    func fetchAdvertisingFailure(err: String)
}


// MARK: Router Input (Presenter -> Router)
protocol RouterAdvertisingScreenProtocol: class {
    static func createModule() -> UIViewController
}

protocol AdvertisingScreenConfiguratorProtocol: class {
    func configure(with viewController: AdvertisingScreenViewController)
}


protocol AdvertisingScreenRouterProtocol: class {
    func closeCurrentViewController()
    func nextViewController()
}
