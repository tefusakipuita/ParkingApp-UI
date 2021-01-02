//
//  ParkingManager.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/15.
//

import SwiftUI
import MapKit

class ParkingManager: ObservableObject {
    
    @Published var parkingData = Data.spots
    
    @Published var selectedPlace = Data.spots[0]
    
    @Published var showDetail = false
    
    @Published var region = MKCoordinateRegion(
        center: Data.spots[0].location,
        span: MKCoordinateSpan(
            latitudeDelta: 0.007,
            longitudeDelta: 0.007))
}
