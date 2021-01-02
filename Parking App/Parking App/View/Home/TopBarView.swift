//
//  TopBarView.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            // MARK: - Left
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .frame(width: 60, height: 60)
                
                VStack (spacing: 6) {
                    Capsule()
                        .fill(Color.black.opacity(0.8))
                        .frame(width: 22, height: 2.4)
                    
                    Capsule()
                        .fill(Color.gray.opacity(0.8))
                        .frame(width: 22, height: 2.4)
                } //: VStack
            } //: ZStack
            .clipped()
            .shadow(color: Color.black.opacity(0.1), radius: 30, x: 8, y: 14)
            
            Spacer()
            
            // MARK: - Right
            ZStack (alignment: .leading) {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .frame(width: 140, height: 60)
                
                HStack {
                    Image("car")
                        .frame(width: 50, height: 50)
                        .padding(.leading, 6)
                    
                    Spacer(minLength: 0)
                    
                    VStack (alignment: .leading, spacing: 4) {
                        Text("My car")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                        
                        Text("A16591")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                    } //: VStack
                    .padding(.trailing, 14)
                } //: HStack
                .frame(width: 140)
            } //: ZStack
            .clipped()
            .shadow(color: Color.black.opacity(0.2), radius: 30, x: 8, y: 14)
        } //: HStack
    }
}

// MARK: - Preview

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
