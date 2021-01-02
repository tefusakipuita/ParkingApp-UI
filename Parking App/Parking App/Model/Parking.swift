//
//  Parking.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI
import MapKit

struct Parking: Identifiable {
    
    let id = UUID()
    let name: String
    let address: String
    let photoName: String
    let place: String
    let carLimit: Int
    let location: CLLocationCoordinate2D
    let fee: CGFloat
    var hour: String
}
