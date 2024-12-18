//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo on 10/12/24.
//

import SwiftUI

public struct ThemeChangeView: View {
    var scheme: ColorScheme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    /// For Sliding Effect
    @Namespace private var animation
    /// View Properties
    @State private var circleOffset: CGSize
    init(scheme: ColorScheme) {
        self.scheme = scheme
        let isDark = scheme == .dark
        self._circleOffset = .init(initialValue: CGSize(width: isDark ? 30 : 150, height: isDark ? -25 : -150))
    }
    public var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(userTheme.colorCircle(scheme).gradient)
                .frame(width: 150, height: 150)
                .mask {
                    /// Inverted Mask
                    Rectangle()
                        .overlay {
                            Circle()
                                .offset(circleOffset)
                                .blendMode(.destinationOut)
                        }
                }
            
            Text("Choose a Style")
                .font(.title2.bold())
                .padding(.top, 25)
            
            Text("Pop or subtle, Day or night.\nCustomize your interface.")
                .multilineTextAlignment(.center)
            
            /// Custom Segmented Picker
            HStack(spacing: 0) {
                ForEach(Theme.allCases, id: \.rawValue) { theme in
                    Text(theme.rawValue)
                        .padding(.vertical, 10)
                        .frame(width: 100)
                        .background {
                            ZStack {
                                if userTheme == theme {
                                    Capsule()
                                        .fill(Color.accentColor)
                                        .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                                }
                            }
                            .animation(.snappy, value: userTheme)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            userTheme = theme
                        }
                }
            }
            .padding(3)
            .background(.primary.opacity(0.06), in: .capsule)
            .padding(.top, 20)
        }
        /// Max Height = 410
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 410)
        .background(userTheme.color(scheme))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal, 15)
        .environment(\.colorScheme, scheme)
        .onChange(of: scheme, initial: false) {_, newValue in
            let isDark = newValue == .dark
            withAnimation(.bouncy) {
                circleOffset = CGSize(width: isDark ? 30 : 150, height: isDark ? -25 : -150)
            }
        }
    }
}

#Preview {
    ThemeChangeView(scheme: .light)
}
