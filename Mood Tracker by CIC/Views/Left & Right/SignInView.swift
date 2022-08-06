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
    @State var isLoadingCheck = false
    @State var isLoadingConfetti = false
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    @Binding var rightSideIsOpen: Bool
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    
    func logIn() {
        
        if (!email.isEmpty && !password.isEmpty) {
            isLoadingCheck = true
            isLoadingConfetti = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Check")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    confetti.triggerInput("Trigger explosion")
                }
            }
        } else {
            isLoadingCheck = true
            isLoadingConfetti = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Error")
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
        }
        .padding(32)
        .background(Color(hex: "17203A"))
        .overlay(
            ZStack {
                if isLoadingCheck {
                    check.view()
                        .frame(width: 100, height: 100)
                        .allowsHitTesting(false)
                }
                if isLoadingConfetti {
                    confetti.view()
                        .scaleEffect(3)
                        .allowsHitTesting(false)
                }
            }
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .leftAndRightEffectModifier(isOpen: rightSideIsOpen, to: 1)
    }
}
