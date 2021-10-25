//
//  OrdersMemStore.swift
//  DemoCleanSwiftArch
//
//  Created by Hiram Castro Maldonado on 25/10/21.
//

import Foundation

class OrderMemStore: OrdersStoreProtocol, OrdersStoreUtilityProtocol {
    
    //MARK: - Data
    
    func fetchOrders(completionHandler: @escaping ([OrderModel], OrdersStoreError?) -> Void) {
        <#code#>
    }
    
    func fetchOrder(id: String, completionHandler: @escaping (OrderModel?, OrdersStoreError?) -> Void) {
        <#code#>
    }
    
    func createOrder(orderToCreate: OrderModel, completionHandler: @escaping (OrderModel?, OrdersStoreError?) -> Void) {
        <#code#>
    }
    
    func updateOrder(orderToUpdate: OrderModel, completionHandler: @escaping (OrderModel?, OrdersStoreError?) -> Void) {
        <#code#>
    }
    
    func deleteOrder(id: String, completionHandler: @escaping (OrderModel?, OrdersStoreError?) -> Void) {
        <#code#>
    }
    
    func fetchOrders(completionHandler: @escaping OrdersStoreFetchOrdersCompletionHandler) {
        <#code#>
    }
    
    func fetchOrder(id: String, completionHandler: @escaping OrdersStoreFetchOrderCompletionHandler) {
        <#code#>
    }
    
    func createOrder(orderToCreate: OrderModel, completionHandler: @escaping OrdersStoreCreateOrderCompletionHandler) {
        <#code#>
    }
    
    func updateOrder(orderToUpdate: OrderModel, completionHandler: @escaping OrdersStoreUpdateOrderCompletionHandler) {
        <#code#>
    }
    
    func deleteOrder(id: String, completionHandler: @escaping OrdersStoreDeleteOrderCompletionHandler) {
        <#code#>
    }
    
    func fetchOrders(completionHandler: @escaping (() throws -> [OrderModel]) -> Void) {
        <#code#>
    }
    
    func fetchOrder(id: String, completionHandler: @escaping (() throws -> OrderModel?) -> Void) {
        <#code#>
    }
    
    func createOrder(orderToCreate: OrderModel, completionHandler: @escaping (() throws -> OrderModel?) -> Void) {
        <#code#>
    }
    
    func updateOrder(orderToUpdate: OrderModel, completionHandler: @escaping (() throws -> OrderModel?) -> Void) {
        <#code#>
    }
    
    func deleteOrder(id: String, completionHandler: @escaping (() throws -> OrderModel?) -> Void) {
        <#code#>
    }
    
    
}
