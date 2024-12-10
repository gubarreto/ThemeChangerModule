//
//  File.swift
//  
//
//  Created by Gustavo on 10/12/24.
//

import Foundation
import SwiftUI

public extension Bundle {
    static var module: Bundle {
        return Bundle(for: BundleToken.self)
    }
    
    private class BundleToken {}
}

public extension Color {
    static let themeBG = Color("ThemeBG", bundle: Bundle.module)
    static let sun = Color("Sun", bundle: Bundle.module)
    static let moon = Color("Moon", bundle: Bundle.module)
}

public enum Theme: String, CaseIterable {
    case systemDefault = "Default"
    case light = "Light"
    case dark = "Dark"
    
    func colorCircle(_ scheme: ColorScheme) -> Color {
        switch self {
        case .systemDefault:
            return scheme == .dark ? .purple : .orange
        case .light:
            return .orange
        case .dark:
            return .purple
        }
    }
    
    func color(_ scheme: ColorScheme) -> Color {
        switch self {
        case .systemDefault:
            return scheme == .dark ? .gray : .white
        case .light:
            return .white
        case .dark:
            return .gray
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
