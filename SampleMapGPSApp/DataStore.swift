//
//  DataStore.swift
//  SampleMapGPSApp
//
//  Created by Amit Gupta on 8/25/23.
//

import Foundation
import MapKit


struct Annotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
    let subtitle: String
}

class DataStore {
    static var label = "UNKNOWN"
    static var lat: Double = 0.0
    static var lon: Double = 0.0
    static var seen: Bool = false
    static var updatedImage=UIImage(named: "xray")
    static var mapScreen:UIImage? = nil
    
    
    static var annotations = [
        Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.33233141, longitude: -122.0312186), title: "Hospital", subtitle: " "),
        Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297), title: "Pharmacy", subtitle: " "),
        //Annotation(coordinate: CLLocationCoordinate2D(latitude: 47.606209, longitude: -122.332071), title: "E.R.", subtitle: " "),
        Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.689294003925625, longitude: -121.70600762975174), title: "Imaging Center", subtitle: " ")
        // 37.689294003925625, -121.70600762975174
    ]
    
    static func getAnnotations() -> [Annotation] {
        if seen {
            annotations.append(Annotation(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon), title: label, subtitle: ""))
        }
        print("Annotations are \(annotations)")
        return annotations
    }
}
