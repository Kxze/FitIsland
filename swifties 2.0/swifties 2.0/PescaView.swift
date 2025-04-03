//
//  PescaView.swift
//  swifties 2.0
//
//  Created by Fernanda Lozoya Navarro on 02/04/25.
//

import SwiftUI
import SplineRuntime

struct PescaView: View {
    var body: some View {
        VStack{
            Onboard3DFishing()
                .frame(width:500)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    PescaView()
}

struct Onboard3DFishing: View {
    var body: some View {
        // fetching from cloud
        let url = URL(string: "https://build.spline.design/WtKBtN4HzdsY47BBWtV7/scene.splineswift")!

        // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

        SplineView(sceneFileURL: url).ignoresSafeArea(.all)
    }
}
