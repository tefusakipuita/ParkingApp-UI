//
//  Extension.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI



extension Color {
    
    static let sample1 = Color("sample1")
    static let sample2 = Color("sample2")
    static let sample3 = Color("sample3")
    static let sample4 = Color("sample4")
}

extension UIScreen {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}

extension CGFloat {
    
    static let cardWidth = UIScreen.screenWidth - 50
    static let cardHeight = (UIScreen.screenWidth - 50) * 0.47
    
    static let detailMapWidth = UIScreen.screenWidth - 80
    static let detailMapHeight = (UIScreen.screenWidth - 80) * 0.8
    
    static let itemWidth = (UIScreen.screenWidth - 80 - 20) / 2
    static let itemHeight = ((UIScreen.screenWidth - 80 - 20) / 2) * 1.1
}

extension UIApplication {
    
    static let inset = UIApplication.shared.windows.first?.safeAreaInsets
}
