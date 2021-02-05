//
//  AdvertisingScreenContract.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 04.02.2021.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewAdvertisingScreenProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAdvertisingScreenProtocol {
    
    var view: PresenterToViewAdvertisingScreenProtocol? { get set }
    var interactor: PresenterToInteractorAdvertisingScreenProtocol? { get set }
    var router: PresenterToRouterAdvertisingScreenProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAdvertisingScreenProtocol {
    
    var presenter: InteractorToPresenterAdvertisingScreenProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAdvertisingScreenProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAdvertisingScreenProtocol {
    
}