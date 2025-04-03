//
//  MainTabView.swift
//  swifties 2.0
//
//  Created by Fernanda Lozoya Navarro on 02/04/25.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case forest = "Bosque"
    case pescar = "Pescar"
    case estadisticas = "Estadisticas"
    
    var systemImageName: String {
        switch self {
        case .forest:
            return "mountain.2"
        case .pescar:
            return "sailboat"
        case .estadisticas:
            return "chart.bar"
        }
        var index : Int {
            return Tab.allCases.firstIndex(of: self) ?? 0
        }
    }
}


