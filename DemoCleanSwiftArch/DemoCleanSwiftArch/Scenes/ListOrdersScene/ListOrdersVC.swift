//
//  ListOrdersVC.swift
//  DemoCleanSwiftArch
//
//  Created by Hiram Castro Maldonado on 25/10/21.
//

import UIKit

protocol ListOrdersDisplayLogic: AnyObject {
    func displayFetchedOrders(viewModel: ListOrders.FetchOrders.ViewModel)
}

final class ListOrdersVC: UITableViewController {
    
}

extension ListOrdersVC: ListOrdersDisplayLogic {
    func displayFetchedOrders(viewModel: ListOrders.FetchOrders.ViewModel) {
        
    }
}
