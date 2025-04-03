//
//  MainTabView.swift
//  swifties 2.0
//
//  Created by Fernanda Lozoya Navarro on 02/04/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
            
            TabView{
                BosqueView()
                    .tabItem {
                    Image(systemName: "mountain.2")
                    Text("Bosque") }.tag(1)
                
                PescaView()
                    .tabItem {
                    Image(systemName: "sailboat")
                        Text("Pescar") }.tag(2)
                
               EstadisticasView()
                    .tabItem {
                    Image(systemName: "chart.bar")
                        Text("Estadisticas") }.tag(2)
                    
        }
            
            
    }
}

#Preview {
    MainTabView()
}
