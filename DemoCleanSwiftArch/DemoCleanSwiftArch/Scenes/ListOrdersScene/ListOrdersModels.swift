//
//  ListOrdersModels.swift
//  DemoCleanSwiftArch
//
//  Created by Hiram Castro Maldonado on 25/10/21.
//

import UIKit

enum ListOrders {
    
    // MARK: - Use Case
    
    enum FetchOrders {
        struct Request { }
        
        struct Response {
            var orders: [OrderModel]
        }
        
        struct ViewModel {
            struct DisplayedOrder {
                var id:String
                var date:String
                var email:String
                var name:String
                var total:String
            }
            var displayedOrders:[DisplayedOrder]
        }
    }
    
}
