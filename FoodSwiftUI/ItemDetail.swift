//
//  ItemDetail.swift
//  FoodSwiftUI
//
//  Created by Ali Emre Değirmenci on 24.03.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {

    @EnvironmentObject var order: Order

    @EnvironmentObject var favorite: Favorite

    @State private var showingAlert = false
    @State var isFavorite = false

    var item: MenuItem

    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -25, y: -5)
            }

            Text(item.description)
                .padding()

            Button("Sipariş Ver") {
                self.order.add(item: self.item)
            }.font(.title)
                .padding(8)
                .background(Color.blue)
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .padding(5)
                .fixedSize()

            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: handleFavorite) {

            Image(systemName: favorite.items.contains(item) ? "star.fill" : "star").font(.title)
            })

        /* Button(action: {
            self.showingAlert = true
        }) {
            Text("Show Alert")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        */
    }

    func handleFavorite() {
        if !self.favorite.items.contains(self.item) {
            self.favorite.add(item: self.item)
            self.isFavorite = true
        } else {
            self.favorite.remove(item: self.item)
            self.isFavorite = false
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()

    static let favorite = Favorite()

    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order).environmentObject(favorite)
        }
    }
}

