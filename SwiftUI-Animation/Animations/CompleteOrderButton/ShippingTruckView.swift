//
//  ShippingTruckView.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 19/12/2020.
//

import SwiftUI

struct ShippingTruckView: View {

    @State public var isPlaced = false
    @State public var isShipped = false

    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "cube.box")
                    .resizable()
                    .opacity(isPlaced ? 1 : 0)
                    .frame(width: 35, height: 35)
                    .animation(Animation.linear(duration: 0.3))
                Spacer()
                    .frame(width: isShipped ? 35 : 200)
                    .animation(Animation.easeInOut(duration: 0.3).delay(1))

            }

            Image("truck")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        }.onTapGesture {
            startShipping()
        }
    }

    func startShipping() {
        isPlaced.toggle()
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { timer in
            isShipped.toggle()
        }
    }

    public func makeOrder() {
        isPlaced.toggle()
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { timer in
            isShipped.toggle()
        }
    }
}

struct ShippingTruckView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingTruckView()
    }
}
