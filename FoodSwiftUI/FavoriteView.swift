//
//  FavoriteView.swift
//  FoodSwiftUI
//
//  Created by Ali Emre Değirmenci on 25.03.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorite: Favorite

    var body: some View {
        NavigationView {
            List {
                ForEach(favorite.items) { item in
                    ItemRow(item: item)
                }
            }
            .navigationBarTitle("Favoriler")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static let favorite = Favorite()

    static var previews: some View {
        FavoriteView().environmentObject(favorite)
    }
}
