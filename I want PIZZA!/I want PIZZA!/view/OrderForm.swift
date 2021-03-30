//
//  OrderForm.swift
//  I want PIZZA!
//
//  Created by HSE  FKN on 30.03.2021.
//

import SwiftUI

struct OrderForm: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresented: Bool
    
    var viewModel: OrdersViewModel
    
    @State var date: Date = Date()
    
    @State var pizzas: [Pizza] = pizzaMock
    @State private var selectedPizza = 0;
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Choose pizza of your dream!")
                    .font(.headline)
                    .fontWeight(.bold)
                Picker("Choose", selection: $selectedPizza, content:
                {
                    ForEach(pizzas, id: \.self) {
                        Text($0.title)
                    }
                })
                Spacer().frame(height: 10)
                ZStack {
                    //Image("Пицца").frame(height: 100)
                    Text(pizzas[selectedPizza].title).font(.title).fontWeight(.bold).foregroundColor(.white)
                }.frame(height: 100)
                Spacer().frame(height: 10)
                Text(pizzas[selectedPizza].description)
                
                Form {
                    Button(action: {
                        viewModel.orders.append(Pizza(title: pizzas[selectedPizza].title, description: pizzas[selectedPizza].description))
                        isPresented = false
                    }, label: {
                        Text("Bring me this pizza!!")
                            .multilineTextAlignment(.center)
                    })
                }
            }
        }
    }
}

struct NewTask_Previews: PreviewProvider {
    
    @State var isPresented: Bool = false
    
    static var previews: some View {
        Orders()
    }
}
