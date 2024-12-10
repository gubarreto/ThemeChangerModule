//
//  File.swift
//  
//
//  Created by Gustavo on 10/12/24.
//

import Foundation
import SwiftUI

extension Bundle {
    static var module: Bundle {
        return Bundle(for: BundleToken.self)
    }
    
    private class BundleToken {}
}

enum Theme: String, CaseIterable {
    case systemDefault = "Default"
    case light = "Light"
    case dark = "Dark"
    
    func color(_ scheme: ColorScheme) -> Color {
        switch self {
        case .systemDefault:
            return scheme == .dark ? Color("Moon", bundle: Bundle.module) : Color("Sun", bundle: Bundle.module)
        case .light:
            return Color("Sun", bundle: Bundle.module)
        case .dark:
            return Color("Moon", bundle: Bundle.module)
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
