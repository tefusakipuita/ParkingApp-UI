//
//  ParckingCardView.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI

struct ParkingCardView: View {
    
    // MARK: - Property
    
    let park: Parking
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.white)
                .frame(width: CGFloat.cardWidth, height: CGFloat.cardHeight)
            
            HStack {
                // MARK: - Card Left
                VStack (alignment: .leading, spacing: 8) {
                    Text(park.name)
                        .font(.system(size: 22, weight: .regular, design: .rounded))
                    
                    Text(park.address)
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    Spacer(minLength: 0)
                    
                    HStack (spacing: 18) {
                        CardItemView(imageName: "car", title: "\(park.carLimit)")
                        
                        CardItemView(imageName: "dollarsign.circle", title: "$\(String(format: "%.2f", park.fee))/h")
                    } //: HStack
                } //: VStack
                .frame(height: 110)
                
                Spacer(minLength: 0)
                
                // MARK: - Card Right
                Image(park.photoName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 110)
                    .cornerRadius(30)
            } //: HStack
            .padding(.horizontal, 25)
            .frame(width: CGFloat.cardWidth)
            
        } //: ZStack
        .clipped()
        .shadow(color: Color.black.opacity(0.1), radius: 30, x: 8, y: 14)
    }
}

// MARK: - Preview

struct ParckingCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
