//
//  ActivityRingView.swift
//  swifties 2.0
//
//  Created by Fernanda Lozoya Navarro on 03/04/25.
//


import SwiftUI

struct ActivityRing: View {
    var progress: Double // 0.0 a 1.0
    var thickness: CGFloat = 20.0
    var colors: [Color] = [.red, .orange]
    
    var body: some View {
        ZStack {
            // Fondo del anillo (gris)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: thickness, lineCap: .round))
                .foregroundColor(.gray.opacity(0.2))
            
            // Anillo de progreso
            Circle()
                .trim(from: 0, to: CGFloat(min(progress, 1.0)))
                .stroke(LinearGradient(gradient: Gradient(colors: colors),
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing),
                        style: StrokeStyle(lineWidth: thickness, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut, value: progress)
        }
    }
}

