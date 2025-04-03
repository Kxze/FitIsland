//
//  EstadisticasView.swift
//  swifties 2.0
//
//  Created by Fernanda Lozoya Navarro on 02/04/25.
//

import SwiftUI

struct EstadisticasView: View {
    var moveProgress: Double = 0.7
    var exerciseProgress: Double = 0.5
    var standProgress: Double = 0.3
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ActivityRing(progress: moveProgress,
                             thickness: 20,
                             colors: [.red, .pink])
                .frame(width: 200, height: 200)
                
                ActivityRing(progress: exerciseProgress,
                             thickness: 20,
                             colors: [.green, .mint])
                .frame(width: 150, height: 150)
                
                ActivityRing(progress: standProgress,
                             thickness: 20,
                             colors: [.blue, .cyan])
                .frame(width: 100, height: 100)
                
            }
            .padding()
            Spacer()
            HStack {
                ZStack{
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 180, height: 180)
                        .cornerRadius(25)
                    Text("Move")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                
                ZStack{
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 180, height: 180)
                        .cornerRadius(25)
                    Text("Move")
                        .font(.caption)
                        .foregroundColor(.white)
                        
                }
            }
            HStack {
                ZStack{
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 180, height: 180)
                        .cornerRadius(25)
                    Text("Move")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                
                ZStack{
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 180, height: 180)
                        .cornerRadius(25)
                    Text("Move")
                        .font(.caption)
                        .foregroundColor(.white)
                        
                }
            }
        }
    }
 
    
    
    
}




#Preview {
    EstadisticasView()
}
