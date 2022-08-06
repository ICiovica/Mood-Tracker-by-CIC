//
//  OnboardingView.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    var body: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 20)
            .background(
                Image("Spline")
                    .blur(radius: 20)
                    .offset(x: 200, y: 50)
            )
    }
}
