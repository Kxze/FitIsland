//
//  Forest.swift
//  swifties 2.0
//
//  Created by kxze on 03/04/25.
//

import SwiftUI

struct Forest: View {
    @State private var activeTab: Tab = .forest
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    
    init(){
        UITabBar.appearance().isHidden =  true
    }
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $activeTab) {
                BosqueView()
                    .tag(Tab.forest)
                    //.toolbar(.hidden, for: .tabBar)
                PescaView()
                    .tag(Tab.pescar)
                    //.toolbar(.hidden, for: .tabBar)
                Text("Estadísticas")
                    .tag(Tab.estadisticas)
                    //.toolbar(.hidden, for: .tabBar)
                
            }
            customTabBar()
        }
    }
    
    @ViewBuilder
    func customTabBar(_ tint: Color = Color(.blue), _ inactiveTint: Color = .blue) -> some View {
        HStack(alignment: .bottom,spacing: 0)
        {
            ForEach(Tab.allCases, id: \.rawValue){
                TabItem(tint: tint, inactiveTint: inactiveTint, tab: $0, animation: animation, activeTab: $activeTab, position: $tabShapePosition)
                    
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content:{
            TabShape(midpoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0), value: activeTab)
    }
}
struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    
    @State private var tabPosition: CGPoint = .zero
    var body: some View {
        VStack(spacing: 5){
            Image(systemName: tab.systemImageName)
                .font(.title2)
                .foregroundStyle(activeTab == tab ? .white: inactiveTint)
                .frame(width: activeTab == tab ? 58: 35, height: activeTab == tab ? 58: 35)
                .background{
                    if activeTab == tab {
                         Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundStyle(activeTab == tab ? tint: .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX
            
            if activeTab == tab {
                position.x = rect.midX
            }
        })
        .onTapGesture
        {
            activeTab = tab
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
}

#Preview {
    ContentView()
}
