//
//  DetailView.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: ParkingManager
    
    @State var region: MKCoordinateRegion
    
    @State var showHourSelection = false
    @State var parkingHour: CGFloat = 0  // 30分ごとに1ずつ増やしていく
    
    @State var appearAnimation = false
    @State var dismisAnimation = false
    
    @State var dragSwipe: CGFloat = 0
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Dark Mask
            Color.black.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
                .opacity(manager.showDetail ? 1 : 0)
                .opacity(dismisAnimation ? 0 : 1)
                .onTapGesture {
                    withAnimation (.spring()) {
                        dismisAnimation = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        manager.showDetail = false
                    }
                }
            
            ZStack (alignment: .top) {
                // MARK: - Background
                Color.white
                    .clipShape(CornerShape(corner: [.topLeft, .topRight], radius: CGSize(width: 75, height: 75)))
                
                VStack (spacing: 16) {
                    // MARK: - Drag Bar
                    Capsule()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 50, height: 4)
                        .padding(.top, 14)
                    
                    // MARK: - Map View
                    Map(coordinateRegion: $region, annotationItems: [manager.selectedPlace]) { _ in
                        MapAnnotation(coordinate: manager.selectedPlace.location, anchorPoint: CGPoint(x: 0.5, y: 1)) {
                            Image("parking_marker")
                                .resizable()
                                .frame(width: 60, height: 60)
                        }
                    }
                    .frame(width: CGFloat.detailMapWidth, height: CGFloat.detailMapHeight)
                    .cornerRadius(40)
                    .padding(.vertical, 20)
                    .shadow(color: Color.black.opacity(0.1), radius: 30, x: 8, y: 14)
                    
                    // MARK: - Info
                    Text(manager.selectedPlace.name)
                        .font(.system(size: 35, weight: .regular, design: .rounded))
                    
                    Text(manager.selectedPlace.address)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    HStack (spacing: 18) {
                        CardItemView(imageName: "car", title: "\(manager.selectedPlace.carLimit)")
                        
                        CardItemView(imageName: "dollarsign.circle", title: "$\(String(format: "%.2f", manager.selectedPlace.fee))/h")
                    } //: HStack
                    
                    
                    // MARK: - Item
                    HStack (spacing: 20) {
                        ItemView(imageName: "place", placeName: manager.selectedPlace.place, title: "Parking Place")
                            .frame(width: CGFloat.itemWidth, height: CGFloat.itemHeight)
                        
                        ItemView(imageName: "cost", placeName: getHour(), title: "Time")
                            .frame(width: CGFloat.itemWidth, height: CGFloat.itemHeight)
                            .onTapGesture {
                                withAnimation {
                                    showHourSelection = true
                                }
                            }
                    } //: HStack
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                    
                    // MARK: - Price View
                    HStack {
                        Text("$\(String(format: "%.2f", parkingHour / 2 * manager.selectedPlace.fee))")
                            .font(.system(size: 24, weight: .regular, design: .rounded))
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.yellow)
                                    .frame(width: 200, height: 70)
                                
                                Text("Pay")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .regular, design: .rounded))
                                    .kerning(2)
                            } //: ZStack
                        }) //: Button
                    } //: HStack
                    .padding(.horizontal, 40)
                    .padding(.top, 15)
                    
                } //: VStack
                
                // MARK: - Top- Draggable Transparent Bar
                Rectangle()
                    .fill(Color.black.opacity(0.001))
                    .frame(width: UIScreen.screenWidth, height: 55)
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .global)
                            .onChanged({ value in
                                swipeView(value: value)
                            })
                            .onEnded({ value in
                                endSwipe(value: value)
                            })
                    ) //: gesture
                
            } //: ZStack
            .frame(height: UIScreen.screenHeight - 80)
            .offset(y: 80)
            .edgesIgnoringSafeArea(.all)
            .offset(y: appearAnimation ? 0 : UIScreen.screenHeight)
            .offset(y: dismisAnimation ? UIScreen.screenHeight : 0)
            .offset(y: dragSwipe)
            
            // MARK: - Hour Selection
            if showHourSelection {
                HourSelectionView(showHourSelection: $showHourSelection, parkingHour: $parkingHour)
            }
            
        } //: ZStack
        .onAppear(perform: {
            withAnimation (.spring()) {
                appearAnimation = true
            }
        })
    }
    
    
    // MARK: - Function
    
    // MARK: - onChanged
    func swipeView(value: DragGesture.Value) {
        let translation = value.translation.height
        
        if translation >= 0 {
            dragSwipe = translation
        }
    }
    
    // MARK: - onEnded
    func endSwipe(value: DragGesture.Value) {
        let translation = value.translation.height
        
        withAnimation (.spring()) {
            if translation > 200 {
                dismisAnimation = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    manager.showDetail = false
                }
            } else {
                dragSwipe = 0
            }
        }
    }
    
    // MARK: - CGFloat から時間に変換する
    func getHour() -> String {
        // parkingHour を 2で割ってから『整数部分』と『少数部分』に分ける (30分刻みにするから２で割る)
        // ( 5 -> 2.5 -> (2.0, 0.5) )
        let hourSeparated = modf(parkingHour / 2)
        // 時  (hourSeparated の整数部分を取得)
        let hourData = "\(Int(hourSeparated.0))"
        // 分  (hourSeparated の少数部分が 0 なら 0m, 0でないなら 30m にする)
        let minuteData = hourSeparated.1 == 0 ? "0" : "30"
        
        return "\(hourData) h \(minuteData) m"
    }
}

// MARK: - Preview

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
