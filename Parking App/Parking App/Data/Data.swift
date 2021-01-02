//
//  Data.swift
//  Parking App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI
import MapKit

struct Data {
    
    static let spots = [
        Parking(name: "California Parking", address: "2351 Mission St, SF", photoName: "1", place: "B1", carLimit: 45, location: CLLocationCoordinate2D(latitude: 37.7985599, longitude: -122.4100056), fee: 5.0, hour: "0.0"),
        Parking(name: "Green St Parking", address: "654 Green St, SF", photoName: "2", place: "A6", carLimit: 15, location: CLLocationCoordinate2D(latitude: 37.7993822, longitude: -122.4077079), fee: 3.0, hour: "0.0"),
        Parking(name: "Bank of America", address: "440 Pine St, SF", photoName: "3", place: "B4", carLimit: 20, location: CLLocationCoordinate2D(latitude: 37.799386, longitude: -122.4092267), fee: 4.0, hour: "0.0"),
        Parking(name: "North Beach Parking", address: "701 Stevenson St, SF", photoName: "4", place: "C2", carLimit: 25, location: CLLocationCoordinate2D(latitude: 37.7983406, longitude: -122.4064634), fee: 3.0, hour: "0.0"),
        Parking(name: "Border Parking", address: "1647 Powell St, SF", photoName: "5", place: "A12", carLimit: 12, location: CLLocationCoordinate2D(latitude: 37.7998639, longitude: -122.4110218), fee: 2.0, hour: "0.0"),
        Parking(name: "Public Parking", address: "455 Castro St, SF", photoName: "6", place: "B9", carLimit: 90, location: CLLocationCoordinate2D(latitude: 37.7978987, longitude: -122.4098621), fee: 1.0, hour: "0.0")
    ]
}
