//
//  CheckoutView.swift
//  FoodSwiftUI
//
//  Created by Ali Emre Değirmenci on 24.03.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order

    static let paymentTypes = ["Nakit", "Kredi Kartı", "Food Puanları"]
    static let tipAmounts = [10, 15, 20, 25, 0]

    let pickupTime = ["Şimdi", "Bu akşam", "Yarın sabah"]

    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }

    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    @State private var selection = 0

    var body: some View {
        Form {
            Section {
                Picker("Hangi ödeme yöntemini kullanmak istersiniz?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("FoodKart ekle")
                }

                if addLoyaltyDetails {
                    TextField("FoodKart numaranızı giriniz", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Sipariş zamanı")) {
                Picker(selection: $selection, label:
                       Text("Picker Name")) {
                           ForEach(0 ..< pickupTime.count) { index in
                               Text(self.pickupTime[index]).tag(index)
                           }
                }.pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("Bahşiş eklemek ister misiniz?")) {
                Picker("Yüzde:" , selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            } 

            Section(header:
                Text("TOPLAM: \(totalPrice, specifier: "%.2f")₺")
                    .font(.largeTitle)
            ) {
                Button("Ödemeyi Onayla") {
                    self.showingPaymentAlert.toggle()
                }.font(.title)
                .padding(8)
                .background(Color.blue)
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))

            }
        }
        .navigationBarTitle(Text("Ödeme"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Sipariş onaylandı"), message: Text("Ödenecek tutar \(totalPrice, specifier: "%.2f")₺ - Teşekkürler"), dismissButton: .default(Text("Tamam")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
