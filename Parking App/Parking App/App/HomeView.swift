//
//  ContentView.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager = ParkingManager()
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: .top) {
            // MARK: - Background
            Color.white.edgesIgnoringSafeArea(.all)
            
            // MARK: - Map View
            Map(coordinateRegion: $manager.region, annotationItems: manager.parkingData) { spots in
                MapAnnotation(coordinate: spots.location, anchorPoint: CGPoint(x: 0.5, y: 1)) {
                    AnnotationView(manager: manager, park: spots)
                }
            }
            .frame(height: UIScreen.screenHeight - 90)
            .clipShape(CornerShape(corner: [.bottomLeft, .bottomRight], radius: CGSize(width: 75, height: 75)))
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                // MARK: - Top Bar
                TopBarView()
                    .padding()
                    .padding(.horizontal, 25)
                
                Spacer(minLength: 0)
                
                // MARK: - Parking Card
                ParkingCardView(park: manager.selectedPlace)
                    .padding(.bottom, 40)
                    .onTapGesture {
                        manager.showDetail = true
                    }
                
                // MARK: - Search View
                SearchBarView()
                    .padding(.horizontal, 41)
                    .padding(.bottom, 6)
                
            } //: VStack
            
            // MARK: - Detail View
            if manager.showDetail {
                DetailView(
                    manager: manager,
                    region: MKCoordinateRegion(
                        center: manager.selectedPlace.location,
                        span: MKCoordinateSpan(
                            latitudeDelta: 0.001,
                            longitudeDelta: 0.001)))
            } //: if
                
        } //: ZStack
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
