//
//  CreateOrderVC.swift
//  DemoCleanSwiftArch
//
//  Created by Hiram Castro Maldonado on 26/10/21.
//

import UIKit


protocol CreateOrderDisplayLogic: AnyObject {
    func displayExpirationDate(viewModel: CreateOrder.FormatExpirationDate.ViewModel)
    func displayCreatedOrder(viewModel: CreateOrder.CreateOrder.ViewModel)
    func displayOrderToEdit(viewModel: CreateOrder.EditOrder.ViewModel)
    func displayUpdatedOrder(viewModel: CreateOrder.UpdateOrder.ViewModel)
}


final class CreateOrderVC: UITableViewController, UITextFieldDelegate {
    
}

extension CreateOrderVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
}

extension CreateOrderVC: CreateOrderDisplayLogic {
    func displayExpirationDate(viewModel: CreateOrder.FormatExpirationDate.ViewModel) {
        
    }
    
    func displayCreatedOrder(viewModel: CreateOrder.CreateOrder.ViewModel) {
        
    }
    
    func displayOrderToEdit(viewModel: CreateOrder.EditOrder.ViewModel) {
        
    }
    
    func displayUpdatedOrder(viewModel: CreateOrder.UpdateOrder.ViewModel) {
        
    }
}
