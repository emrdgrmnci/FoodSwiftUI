//
//  ContentView.swift
//  FoodSwiftUI
//
//  Created by Ali Emre Değirmenci on 24.03.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    init() {
        UINavigationBar.appearance().backgroundColor = .red
        UINavigationBar.appearance().tintColor = .white
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {

                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        navigationBar.standardAppearance = appearance
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
