//
//  ProductDetailTransition.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 11/01/2021.
//

import SwiftUI

import SwiftUI

struct ProductDetailTransition: View {
@State private var unZoom = true
@State private var showDetails = false
@Namespace private var morphSeamlessly

    let screenWidth = UIScreen.main.bounds.size.width

    var body: some View {
        ZStack {

            if unZoom { // Show profile

                HStack {
                    Image("mainModel")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .matchedGeometryEffect(id: "morph", in: morphSeamlessly)

                    VStack(alignment: .leading) {
                        Text("Netta")

                        Text("Content Strategist")
                            .foregroundColor(.secondary)
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                            Text("Mississauga ON")
                                .font(.caption)
                        }
                    }
                }.opacity(unZoom ? 1 : 0)
                .animation(.easeInOut(duration: 0.3))
            }

            else{  // Shoew zoomed
                ZStack {
                    Image("model")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .scaleEffect(unZoom ? 0 : 1, anchor: .center)
                        .matchedGeometryEffect(id: "morph", in: morphSeamlessly)
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        Spacer()

                        VStack() {
                            ZStack(alignment: .top) {
                                RoundedRectangle(cornerRadius: 30, style: .circular)
                                    .foregroundColor(.gray)

                                ProductInfo()
                            }.frame(width: screenWidth, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .opacity(showDetails ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3))
                    .edgesIgnoringSafeArea(.bottom)
                }
            }

        }
        .onTapGesture(count: 1, perform: {
            withAnimation(
                Animation.interpolatingSpring(stiffness: 150, damping: 20)
            ){
                unZoom.toggle()

                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
                    showDetails.toggle()
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailTransition()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

struct ProductInfo: View {
    let screenWidth = UIScreen.main.bounds.size.width

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .circular)
                .foregroundColor(.white)
                .frame(width: screenWidth, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

//            HStack {
//                Text("PAPERBAG BERMUDA SHORTS")
//                    .foregroundColor(.black)
//
//                Spacer()
//
//                HStack {
//                    Image(systemName: "square.and.arrow.up")
//
//                    Image(systemName: "heart.fill")
//                }.foregroundColor(.gray)
//            }
        }
    }
}
