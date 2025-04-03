//
//  BosqueView.swift
//  swifties 2.0
//
//  Created by Fernanda Lozoya Navarro on 02/04/25.
//

import SwiftUI
import SplineRuntime
struct BosqueView: View {
    var body: some View {
        VStack{
            Onboard3Dview()
        }
    }
}

#Preview {
    Onboard3Dview()
}


struct Onboard3Dview: View {
    var body: some View {
        // fetching from cloud
        let url = URL(string: "https://build.spline.design/aB5XQttngRpS4qhAVNwt/scene.splineswift")!

        // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

        SplineView(sceneFileURL: url).ignoresSafeArea(.all)
    }
}
