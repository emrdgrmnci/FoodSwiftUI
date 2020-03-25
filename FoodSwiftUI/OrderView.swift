//
//  OrderView.swift
//  FoodSwiftUI
//
//  Created by Ali Emre Değirmenci on 24.03.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("₺\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Sipariş Ver")
                    }
                }.disabled(order.items.isEmpty)
            }
            .navigationBarTitle("Sipariş")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
