//
//  ItemView.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/15.
//

import SwiftUI

struct ItemView: View {
    
    // MARK: - Property
    
    let imageName: String
    let placeName: String
    let title: String
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 30, x: 8, y: 14)
            
            VStack (spacing: 6) {
                // MARK: - Image
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(.bottom, 14)
                
                // MARK: - Place
                Text(placeName)
                    .font(.system(size: 20, weight: .regular, design: .rounded))
                
                // MARK: - Title
                Text(title)
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                
            } //: VStack
        } //: ZStack
    }
}

// MARK: - Preview

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
