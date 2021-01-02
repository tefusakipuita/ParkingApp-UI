//
//  Shape.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/15.
//

import SwiftUI

struct CornerShape: Shape {
    let corner: UIRectCorner
    let radius: CGSize
    
    func path(in rect: CGRect) -> Path {
        var path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: radius)
        
        return Path(path.cgPath)
    }
}
