//
//  AmigosView.swift
//  swifties 2.0
//
//  Created by Fernanda Lozoya Navarro on 02/04/25.
//

import SwiftUI

struct PlayerScore: Identifiable {
    let id = UUID()
    let name: String
    //let score: Int
    let avatar: String
    let isCurrentPlayer: Bool
}

struct LeaderboardView: View {
    let players: [PlayerScore] = [
        PlayerScore(name: "JugadorPro", avatar: "person.crop.circle.fill", isCurrentPlayer: false),
        PlayerScore(name: "MasterGamer",avatar: "person.crop.circle.fill", isCurrentPlayer: false),
        PlayerScore(name: "Tú", avatar: "person.crop.circle.fill", isCurrentPlayer: true),
        PlayerScore(name: "NuevoJugador",  avatar: "person.crop.circle.fill", isCurrentPlayer: false),
        PlayerScore(name: "Aventurero", avatar: "person.crop.circle.fill", isCurrentPlayer: false)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Encabezado con pestañas
                Picker("Tipo de leaderboard", selection: .constant(0)) {
                    Text("Global").tag(0)
                    Text("Amigos").tag(1)
                    //Text("Semanal").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Lista de jugadores
                List {
                    ForEach(Array(players.enumerated()), id: \.element.id) { index, player in
                        PlayerRow(player: player, rank: index + 1)
                            .listRowBackground(player.isCurrentPlayer ? Color.blue.opacity(0.1) : Color.clear)
                    }
                }
                .listStyle(PlainListStyle())
                
               
            }
            .navigationTitle("Leaderboard")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PlayerRow: View {
    let player: PlayerScore
    let rank: Int
    
    var body: some View {
        HStack {
            // Posición
            Text("\(rank)")
                .font(.title2)
                .frame(width: 30)
                .foregroundColor(rank <= 3 ? .yellow : .primary)
            
            // Avatar
            Image(systemName: player.avatar)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
            
            // Nombre
            HStack {
                
                Text(player.name)
                    .font(.headline)
                Spacer()
                Button("Visitar") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                  
                  .font(.caption)
                         .padding(.horizontal, 12)
                         .padding(.vertical, 6)
                         .background(
                             RoundedRectangle(cornerRadius: 15)
                                 .stroke(Color.blue, lineWidth: 1)
                             )
                         .foregroundColor(.gray)
                   
                   
            }
            
            Spacer()
            
          
        }
        .padding(.vertical, 8)
    }
}
