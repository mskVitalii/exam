//
//  OrdersVault.swift
//  I want PIZZA!
//
//  Created by HSE  FKN on 30.03.2021.
//

import Foundation

class OrdersVault {
    let userDefaults = UserDefaults.standard
    let key = "SavedPizzas"
    
    func saveData(Pizzas: [Pizza]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(Pizzas) {
            userDefaults.set(encoded, forKey: key)
        }
    }
    
    func loadData() -> [Pizza] {
        var Pizzas = [Pizza]()
        if let items = userDefaults.data(forKey: key) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Pizza].self, from: items) {
                Pizzas = decoded
                return Pizzas
            }
        }
        return []
    }
}
