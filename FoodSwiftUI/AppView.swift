//
//  AppView.swift
//  FoodSwiftUI
//
//  Created by Ali Emre Değirmenci on 24.03.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menü")
            }
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Sipariş")
            }
           FavoriteView()
                           .tabItem {
                               Image(systemName: "star.fill")
                               Text("Favoriler")
                       }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static let favorite = Favorite()
    static var previews: some View {
        AppView().environmentObject(favorite)
    }
}
