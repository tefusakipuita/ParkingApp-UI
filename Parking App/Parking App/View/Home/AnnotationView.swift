//
//  Annotation.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/15.
//

import SwiftUI

struct AnnotationView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: ParkingManager
    
    let park: Parking
    
    
    // MARK: - Body
    
    var body: some View {
        
        Button(action: {
            manager.selectedPlace = park
        }, label: {
            ZStack (alignment: .bottom) {
                // MARK: - 選択されている annotation なら
                Image("parking_marker")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .opacity(park.id == manager.selectedPlace.id ? 1 : 0)
                    .scaleEffect(park.id == manager.selectedPlace.id ? 1 : 0, anchor: .bottom)
                    .animation(park.id == manager.selectedPlace.id ? .spring() : nil)
                
                // MARK: - 未選択の annotaion なら
                ZStack {
                    Image("cost_marker")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text("$\(Int(park.fee))")
                        .foregroundColor(.white)
                        .offset(y: -2)
                } //: ZStack
                .opacity(park.id == manager.selectedPlace.id ? 0 : 1)
                .scaleEffect(park.id == manager.selectedPlace.id ? 0 : 1, anchor: .bottom)
                .animation(park.id == manager.selectedPlace.id ? .spring() : nil)
            } //: ZStack
            
        }) //: Button
    }
}

// MARK: - Preview

struct Annotation_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
