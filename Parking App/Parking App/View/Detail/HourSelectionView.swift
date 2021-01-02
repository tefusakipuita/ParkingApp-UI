//
//  HourSelectionView.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/15.
//

import SwiftUI

struct HourSelectionView: View {
    
    // MARK: - Property
    
    @Binding var showHourSelection: Bool
    
    @Binding var parkingHour: CGFloat
    
    @State var closeAnimation = false
    
    var widthPerRular = (UIScreen.screenWidth - 80) / 12
    
    @State var moveX: CGFloat = 0
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: .top) {
            // MARK: - Dark Mask
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
                .opacity(closeAnimation ? 0 : 1)
                .onTapGesture {
                    withAnimation {
                        closeAnimation = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            showHourSelection = false
                        }
                    }
                }
            
            ZStack {
                // MARK: - Background
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                
                VStack (spacing: 22) {
                    // MARK: - Text
                    Text("Choose Hour (max: 6hour)")
                    
                    // MARK: - Slider
                    ZStack (alignment: .leading) {
                        // MARK: - Rular
                        HStack (alignment: .bottom) {
                            ForEach(0..<13) { i in
                                VStack (spacing: 14) {
                                    Capsule()
                                        .fill(Color.gray.opacity(0.5))
                                        .frame(width: 3, height: i % 2 == 0 ? 13 : 8)
                                    
                                    Text("\(i / 2)")
                                        .frame(width: 10)
                                        .opacity(i % 2 == 0 ? 1 : 0)
                                } //: VStack
                                
                                if i != 12 {
                                    Spacer()
                                }
                            } //: ForEach
                        } //: HStack
                        
                        // MARK: - Progress Bar
                        Capsule()
                            .fill(Color.yellow)
                            .frame(width: moveX, height: 10)
                            .offset(x: 4)
                            .offset(y: -14)
                        
                        
                        
                        // MARK: - Knob View
                        ZStack {
                            Circle()
                                .fill(Color(white: 0.25))
                                .frame(width: 30, height: 30)
                            
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 10, height: 10)
                        } //: ZStack
                        .offset(y: -14)
                        .offset(x: -15)  // knob の半径分
                        .offset(x: moveX)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged({ value in
                                    onChanged(value: value)
                                })
                                .onEnded({ value in
                                    onEnded(value: value)
                                })
                        )
                        
                    } //: ZStack
                    .padding(.horizontal, 40)
                    
                } //: VStack
            } //: ZStack
            .frame(width: UIScreen.screenWidth, height: 130)
            .offset(y: 240)
            .offset(x: closeAnimation ? UIScreen.screenWidth : 0)
            
        } //: ZStack
        .onAppear(perform: {
            initializePosition()
        })
    }
    
    // MARK: - Function
    
    func initializePosition() {
        moveX = widthPerRular * parkingHour
    }
    
    func onChanged(value: DragGesture.Value) {
        let locationX = value.location.x
        
        if 0 <= locationX && locationX <= (UIScreen.screenWidth - 80) {
            parkingHour = (locationX / widthPerRular).rounded()
            
            moveX = locationX
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation (.spring()) {
            moveX = widthPerRular * parkingHour
        }
    }
}

// MARK: - Preview

struct HourSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
