//
//  SignInView.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @State var show: Bool = false
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    @Binding var rightSideIsOpen: Bool
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    
    func logIn() {
        isLoading = true
        
        if email != "" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Check")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                confetti.triggerInput("Trigger explosion")
                withAnimation {
                    isLoading = false
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    show.toggle()
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Sign in")
                .customFont(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
                .overlay(
                    HStack {
                        Spacer()
                        button.view()
                            .frame(width: 40, height: 40)
                            .onTapWithAnimation {
                                rightSideIsOpen = false
                            }
                            .onAppear {
                                button.setInput("isOpen", value: false)
                            }
                    }
                )
            Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.")
                .foregroundColor(.white)
                .opacity(0.75)
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subheadline)
                    .foregroundColor(.white)
                TextField("", text: $email)
                    .customTextField(image: Image("Icon Email"))
            }
            VStack(alignment: .leading) {
                Text("Password")
                    .customFont(.subheadline)
                    .foregroundColor(.white)
                SecureField("", text: $password)
                    .customTextField(image: Image("Icon Lock"))
            }
            Spacer()
            Button {
                logIn()
            } label: {
                HStack {
                    Image(systemName: "arrow.right")
                    Text("Sign in")
                        .customFont(.headline)
                }
                .largeButton()
            }
            
            HStack {
                Rectangle().frame(height: 1).opacity(0.1)
                Text("OR").customFont(.subheadline2).foregroundColor(.white)
                Rectangle().frame(height: 1).opacity(0.1)
            }
            
            Text("Sign up with Email, Apple, Google")
                .customFont(.subheadline)
                .foregroundColor(.white)
            
            HStack {
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }
        }
        .padding(32)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .overlay(
            ZStack {
                if isLoading {
                    check.view()
                        .frame(width: 100, height: 100)
                        .allowsHitTesting(false)
                }
                confetti.view()
                    .scaleEffect(3)
                    .allowsHitTesting(false)
            }
        )
        .mask(RoundedRectangle(cornerRadius: 32, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
        .opacity(rightSideIsOpen ? 1 : 0)
        .offset(x: rightSideIsOpen ? 0 : 300)
        .rotation3DEffect(.degrees(rightSideIsOpen ? 0 : 30), axis: (x: 0, y: -1, z: 0))
        .padding(.horizontal, 32)
        .padding(.top)
    }
}
