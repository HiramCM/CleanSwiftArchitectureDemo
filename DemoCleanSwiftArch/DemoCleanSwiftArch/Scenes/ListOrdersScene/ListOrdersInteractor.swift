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
    var ordersWorker = OrdersWorker(ordersStore: OrdersMemStore())
    
    var orders: [OrderModel]?
    
    //MARK: - Fetch Orders
    
    func fetchOrders(request: ListOrders.FetchOrders.Request) {
        ordersWorker.fetchOrders { (orders) -> Void in
            self.orders = orders
            let response = ListOrders.FetchOrders.Response(orders: orders)
            self.presenter?.presentFetchedOrders(response: response)
        }
    }
    
}
