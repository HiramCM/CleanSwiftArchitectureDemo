//
//  OrdersWorker.swift
//  DemoCleanSwiftArch
//
//  Created by Hiram Castro Maldonado on 25/10/21.
//

import Foundation

class OrdersWorker {
    
    var ordersStore: OrdersStoreProtocol
    
    init(ordersStore: OrdersStoreProtocol) {
        self.ordersStore = ordersStore
    }
    
    func fetchOrders(completionHandler: @escaping ([OrderModel]) -> Void) {
        ordersStore.fetchOrders { (orders: () throws -> [OrderModel]) -> Void in
            do {
                let orders = try orders()
                DispatchQueue.main.async {
                    completionHandler(orders)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler([])
                }
            }
        }
    }
    
    func createOrder(ordertoCreate: OrderModel, completionHandler: @escaping (OrderModel?) -> Void) {
        ordersStore.createOrder(orderToCreate: ordertoCreate) { (order: () throws -> OrderModel?) -> Void in
            do {
                let order = try order()
                DispatchQueue.main.async {
                    completionHandler(order)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func updateOrder(ordertoCreate: OrderModel, completionHandler: @escaping (OrderModel?) -> Void) {
        ordersStore.updateOrder(orderToUpdate: ordertoCreate) { (order: () throws -> OrderModel?) -> Void in
            do {
                let order = try order()
                DispatchQueue.main.async {
                    completionHandler(order)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
    }
    
}

// MARK: - Orders store API

protocol OrdersStoreProtocol {
  // MARK: CRUD operations - Optional error
  
  func fetchOrders(completionHandler: @escaping ([OrderModel], OrdersStoreError?) -> Void)
  func fetchOrder(id: String, completionHandler: @escaping (OrderModel?, OrdersStoreError?) -> Void)
  func createOrder(orderToCreate: OrderModel, completionHandler: @escaping (OrderModel?, OrdersStoreError?) -> Void)
  func updateOrder(orderToUpdate: OrderModel, completionHandler: @escaping (OrderModel?, OrdersStoreError?) -> Void)
  func deleteOrder(id: String, completionHandler: @escaping (OrderModel?, OrdersStoreError?) -> Void)
  
  // MARK: CRUD operations - Generic enum result type
  
  func fetchOrders(completionHandler: @escaping OrdersStoreFetchOrdersCompletionHandler)
  func fetchOrder(id: String, completionHandler: @escaping OrdersStoreFetchOrderCompletionHandler)
  func createOrder(orderToCreate: OrderModel, completionHandler: @escaping OrdersStoreCreateOrderCompletionHandler)
  func updateOrder(orderToUpdate: OrderModel, completionHandler: @escaping OrdersStoreUpdateOrderCompletionHandler)
  func deleteOrder(id: String, completionHandler: @escaping OrdersStoreDeleteOrderCompletionHandler)
  
  // MARK: CRUD operations - Inner closure
  
  func fetchOrders(completionHandler: @escaping (() throws -> [OrderModel]) -> Void)
  func fetchOrder(id: String, completionHandler: @escaping (() throws -> OrderModel?) -> Void)
  func createOrder(orderToCreate: OrderModel, completionHandler: @escaping (() throws -> OrderModel?) -> Void)
  func updateOrder(orderToUpdate: OrderModel, completionHandler: @escaping (() throws -> OrderModel?) -> Void)
  func deleteOrder(id: String, completionHandler: @escaping (() throws -> OrderModel?) -> Void)
}

protocol OrdersStoreUtilityProtocol {}

extension OrdersStoreUtilityProtocol {
    func generateOrderID(order: inout OrderModel) {
        guard order.id == nil else { return }
        order.id = "\(arc4random())"
    }
    
    func calculateOrderTotal(order: inout OrderModel) {
        guard order.total == NSDecimalNumber.notANumber else { return }
        order.total = NSDecimalNumber.one
    }
}

// MARK: - Orders store CRUD operation results
typealias OrdersStoreFetchOrdersCompletionHandler   = (OrdersStoreResult<[OrderModel]>) -> Void
typealias OrdersStoreFetchOrderCompletionHandler    = (OrdersStoreResult<OrderModel>) -> Void
typealias OrdersStoreCreateOrderCompletionHandler   = (OrdersStoreResult<OrderModel>) -> Void
typealias OrdersStoreUpdateOrderCompletionHandler   = (OrdersStoreResult<OrderModel>) -> Void
typealias OrdersStoreDeleteOrderCompletionHandler   = (OrdersStoreResult<OrderModel>) -> Void

enum OrdersStoreResult<U> {
    case Success(result: U)
    case Failure(error: OrdersStoreError)
}

// MARK: - Orders store CRUD operation errors
enum OrdersStoreError: Equatable, Error {
  case CannotFetch(String)
  case CannotCreate(String)
  case CannotUpdate(String)
  case CannotDelete(String)
}

func ==(lhs: OrdersStoreError, rhs: OrdersStoreError) -> Bool {
  switch (lhs, rhs) {
  case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
  case (.CannotCreate(let a), .CannotCreate(let b)) where a == b: return true
  case (.CannotUpdate(let a), .CannotUpdate(let b)) where a == b: return true
  case (.CannotDelete(let a), .CannotDelete(let b)) where a == b: return true
  default: return false
  }
}
