//
//  File.swift
//  
//
//  Created by Gustavo on 10/12/24.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable {
    case systemDefault = "Default"
    case light = "Light"
    case dark = "Dark"
    
    func color(_ scheme: ColorScheme) -> Color {
        switch self {
        case .systemDefault:
            return scheme == .dark ? Color("Moon") : Color("Sun")
        case .light:
            return Color("Sun")
        case .dark:
            return Color("Moon")
        }
    }
    
    var colorScheme: ColorScheme? {
        switch self {
        case .systemDefault:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
