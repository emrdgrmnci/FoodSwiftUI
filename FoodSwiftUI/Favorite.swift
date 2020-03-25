//
//  Favorite.swift
//  FoodSwiftUI
//
//  Created by Ali Emre Değirmenci on 25.03.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import SwiftUI

class Favorite: ObservableObject {
    @Published var items = [MenuItem]()

    func add(item: MenuItem) {
        if !items.contains(item) {
            items.append(item)
        }
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
