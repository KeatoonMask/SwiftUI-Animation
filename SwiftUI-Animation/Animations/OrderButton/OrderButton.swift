//
//  OrderButton.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 24/12/2020.
//

import SwiftUI

enum OrderStatus {
    case ready
    case started
    case finished
}

struct OrderButton: View {

    @State private var status: OrderStatus = .ready
    @State private var showShippingTruck = false

    private var progressBarWidth: CGFloat = 250
    private var animationTime: TimeInterval = 0.4
    private var progressBarAnimationTime: TimeInterval = 3

    @State private var isPlaced = false

    var body: some View {
        ZStack {
            darkGray
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Shipping truck animation


                // Progress Bar
                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                                .frame(width:(status == .ready) ? 0 : 150)

                            ShippingTruck(isPlaced: $isPlaced)
                                .foregroundColor(darkPink)
                                .opacity(showShippingTruck ? 1 : 0)
                                .animation(Animation.linear(duration: (status == .started && showShippingTruck) ? progressBarAnimationTime : animationTime).delay(0.3))

                            Spacer()
                                .frame(width:(status == .ready) ? 150 : 0)
                        }.frame(width: progressBarWidth)

                        Spacer()
                            .frame(height: 130)
                    }

                    if status != .finished {
                        RoundedRectangle(cornerRadius: 20, style: .circular)
                            .fill(status == .finished ? darkPink : darkBlue)
                            .frame(width: (status == .finished) ? 80 : 250,
                                   height: (status == .started || showShippingTruck) ? 12 : 80)
                            .animation(.linear(duration: animationTime))
                    }


                    HStack {
                        RoundedRectangle(cornerRadius: 20, style: .circular)
                            .fill(darkPink)
                            .frame(height: (status == .finished) ? 80 : 12)
                            .animation(.linear(duration: (status == .finished) ? animationTime : progressBarAnimationTime))

                        Spacer()
                            .frame(width:(status == .ready) ? progressBarWidth : 0)
                    }.frame(width:(status == .finished) ? 80 : progressBarWidth)

                    if status != .finished {
                        Text("COMPLETE ORDER")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                            .opacity((status == .started || showShippingTruck) ? 0 : 1)
                            .animation(.linear(duration: animationTime - 0.1))
                    }



                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(Color.white)
                            .opacity((status == .finished) ? 1 : 0)
                            .animation(Animation.linear(duration: animationTime).delay(0.6))


                }.frame(width: progressBarWidth)
                .onTapGesture {
                    download()
                }
            }
        }
    }

    func download() {
        showShippingTruck.toggle()
        isPlaced.toggle()


        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { timer in
            status = .started
        }
        Timer.scheduledTimer(withTimeInterval: 3.6, repeats: false) { timer in
            showShippingTruck.toggle()
        }

        Timer.scheduledTimer(withTimeInterval: 4.5, repeats: false) { timer in
            status = .finished
        }
    }

}

struct ShippingTruck: View {

    @Binding public var isPlaced: Bool

    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "cube.box")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .font(.system(size: 16, weight: .semibold))

                Spacer()
                    .frame(width:37)
            }

            Image("truck")
                .renderingMode(.template)
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
    }
}

struct OrderButton_Previews: PreviewProvider {
    static var previews: some View {
        OrderButton()
    }
}
