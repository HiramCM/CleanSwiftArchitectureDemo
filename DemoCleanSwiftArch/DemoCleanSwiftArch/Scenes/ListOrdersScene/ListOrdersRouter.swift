//
//  ListOrdersRouter.swift
//  DemoCleanSwiftArch
//
//  Created by Hiram Castro Maldonado on 26/10/21.
//

import UIKit

@objc protocol ListOrdersRoutingLogic {
    func routeToCreateOrder(segue: UIStoryboardSegue?)
    func routeToShowOrder(segue: UIStoryboardSegue?)
}

protocol ListOrdersDataPassing {
    var dataStore: ListOrdersDataStore? { get }
}

class ListOrdersRouter: NSObject, ListOrdersRoutingLogic, ListOrdersDataPassing {
    
    weak var viewController: ListOrdersVC?
    var dataStore: ListOrdersDataStore?
    
    // MARK: Routing
    
    func routeToCreateOrder(segue: UIStoryboardSegue?) {
        
    }
    
    func routeToShowOrder(segue: UIStoryboardSegue?) {
        
    }
    
    // MARK: Navigation to Create Order
    
    func navigateToCreateOrder(source: ListOrdersVC, destination: CreateOrderVC) {
      source.show(destination, sender: nil)
    }
    
      
    //MARK: - Navigation to Show Order
    
    // MARK: Passing data
    
    func passDataToCreateOrder(source: ListOrdersDataStore, destination: inout CreateOrderVC) {
        
    }
    
}
