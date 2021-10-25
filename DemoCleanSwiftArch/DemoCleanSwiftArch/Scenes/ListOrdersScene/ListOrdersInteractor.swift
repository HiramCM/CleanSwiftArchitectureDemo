//
//  ListOrdersInteractor.swift
//  DemoCleanSwiftArch
//
//  Created by Hiram Castro Maldonado on 25/10/21.
//

import UIKit

protocol ListOrdersBusinessLogic {
    func fetchOrders(request: ListOrders.FetchOrders.Request)
}

protocol ListOrdersDataStore {
    var orders:[OrderModel]? { get }
}

class ListOrdersInteractor: ListOrdersBusinessLogic, ListOrdersDataStore {
    
    var presenter:ListOrdersPresentationLogic?
    var ordersWorker = OrdersWorker(ordersStore: <#T##OrdersStoreProtocol#>)
    
    var orders: [OrderModel]?
    
    func fetchOrders(request: ListOrders.FetchOrders.Request) {
        
    }
    
}
