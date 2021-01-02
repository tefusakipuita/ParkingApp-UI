//
//  CardItemView.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/15.
//

import SwiftUI

struct CardItemView: View {
    
    // MARK: - Property
    
    let imageName: String
    let title: String
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 6) {
            Image(systemName: imageName)
                .foregroundColor(Color.black.opacity(0.7))
                .font(.system(size: 15))
            
            Text(title)
                .font(.system(size: 19, weight: .light))
        } //: HStack
    }
}

// MARK: - Preview

struct CardItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
