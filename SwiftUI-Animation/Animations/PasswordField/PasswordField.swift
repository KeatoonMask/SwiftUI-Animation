//
//  PasswordField.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 24/03/2021.
//

import SwiftUI

struct PasswordField: View {

    @State private var password = "password"
    @State private var showPassword = true
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 50.0)
                    .frame(width: 300, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(darkGray)

                HStack {
                    if !showPassword {
                        Spacer()
                    }

                    RoundedRectangle(cornerRadius: showPassword ? 25.0 : 50.0)
                        .frame(width: showPassword ?  300 : 50, height: showPassword ?  75 : 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .animation(.linear(duration: 0.2))
                        .foregroundColor(clearGray)
                        .padding(.trailing, showPassword ? 0 : 12)
                }

                HStack {
                    if showPassword {
                        TextField("Password", text: $password)
                            .font(.headline)
                            .foregroundColor(darkGray)
                            .padding(.leading, 20)
                    } else {
                        SecureField("Password", text: $password)
                            .foregroundColor(clearGray)
                            .padding(.leading, 20)
                    }

                    Spacer()

                    Image(systemName: showPassword ?  "eye" : "eye.slash")
                        .resizable()
                        .frame(width: 32, height: 20)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(darkGray)
                        .padding(.trailing, 20)
                        .onTapGesture {
                            showPassword.toggle()
                    }
                }
            }
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            clearBlue.edgesIgnoringSafeArea(.all)
            PasswordField()
                .frame(width: 300)
                .previewDevice("iPhone 12")
        }
    }
}
