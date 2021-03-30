//
//  ordersViewModel.swift
//  I want PIZZA!
//
//  Created by HSE  FKN on 30.03.2021.
//

import Foundation


class OrdersViewModel: ObservableObject {
    let ordersSaver = OrdersVault()
    
    @Published var orders: [Pizza] {
        didSet {
            ordersSaver.saveData(Pizzas: orders)
        }
    }

    init() {
        self.orders = ordersSaver.loadData()
    }
}
