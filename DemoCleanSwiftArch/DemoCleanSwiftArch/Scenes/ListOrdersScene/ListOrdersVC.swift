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
    
    var interactor: ListOrdersBusinessLogic?
    var router: (NSObjectProtocol & ListOrdersRoutingLogic & ListOrdersDataPassing)?
    
    var displayedOrders: [ListOrders.FetchOrders.ViewModel.DisplayedOrder] = []
    
    
    //MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    //MARK: - View lifecycle
    override func  viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchOrders()
    }
    
    //MARK: - Setup
    
    private func setup() {
        let vc = self
        let interactor = ListOrdersInteractor()
        let presenter = ListOrdersPresenter()
        let router = ListOrdersRouter()
        
        vc.interactor = interactor
        vc.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = vc
        
        router.viewController = vc
        router.dataStore = interactor
    }
    
    //MARK: - Fetch orders
    private func fetchOrders() {
        let request = ListOrders.FetchOrders.Request()
        interactor?.fetchOrders(request: request)
    }
    
}

extension ListOrdersVC: ListOrdersDisplayLogic {
    func displayFetchedOrders(viewModel: ListOrders.FetchOrders.ViewModel) {
        displayedOrders = viewModel.displayedOrders
    }
}
