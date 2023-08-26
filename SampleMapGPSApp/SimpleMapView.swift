//
//  SimpleMapView.swift
//  SampleMapGPSApp
//
//  Created by Amit Gupta on 8/25/23.
//

import SwiftUI

import SwiftUI
import MapKit

struct SimpleMapView: View {
    @ObservedObject var locationManager : LocationManager
    
    func mapMidPointAndSpan() -> MKCoordinateRegion {
        var min_lat=DataStore.annotations[0].coordinate.latitude
        var max_lat=DataStore.annotations[0].coordinate.latitude
        var min_lon=DataStore.annotations[0].coordinate.longitude
        var max_lon=DataStore.annotations[0].coordinate.longitude
        for a in DataStore.annotations {
            let lat_a=a.coordinate.latitude
            let lon_a=a.coordinate.longitude
            min_lat=min(lat_a,min_lat)
            max_lat=max(lat_a,min_lat)
            min_lon=min(lon_a,min_lon)
            max_lon=max(lon_a,min_lon)
        }
        let mid_lat=0.5*(min_lat+max_lat)
        let mid_lon=0.5*(min_lon+max_lon)
        let span_lat=(max_lat-min_lat)*1.2+0.2
        let span_lon=(max_lon-min_lon)*1.2+0.2
        return MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: mid_lat, longitude: mid_lon),span:MKCoordinateSpan(latitudeDelta: span_lat, longitudeDelta: span_lon))
    }
    
    var body: some View {
        // Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33233141, longitude: -122.0312186), span: MKCoordinateSpan(latitudeDelta: 10.5, longitudeDelta: 10.5))), showsUserLocation: true, annotationItems: annotations)
        VStack {
            Text("My map")
                .font(.system(size: 42))
            Map(coordinateRegion: .constant(mapMidPointAndSpan()), showsUserLocation: true, annotationItems: DataStore.getAnnotations())
            { annotation in
                MapAnnotation(coordinate: annotation.coordinate) {
                    VStack {
                        Text(annotation.title)
                            .font(.system(size: 24))
                        //Text(annotation.subtitle).font(.system(size: 18))
                    }
                }
            }
            .onAppear {
                MKMapView.appearance().mapType = .mutedStandard
                MKMapView.appearance().pointOfInterestFilter = .excludingAll
            }
        }
        
    }
}


struct SimpleMapView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleMapView(locationManager: LocationManager())
    }
}
