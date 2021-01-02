//
//  SearchBarView.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI

struct SearchBarView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 24, weight: .light))
                .padding(.trailing, 14)
            
            TextField("Parking address...", text: .constant(""))
            
            Spacer(minLength: 0)
            
            Image(systemName: "chevron.left")
        } //: HStack
    }
}

// MARK: - Preview

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
