//
//  ContentView.swift
//  I want PIZZA!
//
//  Created by HSE  FKN on 30.03.2021.
//

import SwiftUI

struct Orders: View {
    
    @ObservedObject var orders = OrdersViewModel()
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<orders.orders.count) {
                    index in Text("Pizza \(orders.orders[index].title)")
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        orders.orders.remove(at: index)
                    }
                }
            }
            .navigationBarItems(leading: Button(action: {
                isPresented.toggle()
            }, label: {
                Text("I WANT MORE PIZZA!")
                    .font(.headline)
                    .multilineTextAlignment(.trailing)
                Image(systemName: "plus")
            }))
        }
        .accentColor(.black)
        .sheet(isPresented: $isPresented, content: {
            OrderForm(isPresented: $isPresented, viewModel: orders)
        })
        
    }
}

struct orders_Previews: PreviewProvider {
    static var previews: some View {
        Orders()
    }
}
