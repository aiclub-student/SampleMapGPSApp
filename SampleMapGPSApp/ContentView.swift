//
//  ContentView.swift
//  SampleMapGPSApp
//
//  Created by Amit Gupta on 8/25/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("lat") var lat=0.0
    @AppStorage("lon") var lon=0.0
    
    var body: some View {
        
        ZStack {
            Color.blue.opacity(0.2).ignoresSafeArea()
            SimpleMapView(locationManager: locationManager)
        }
        .onAppear(){
            locationManager.requestLocation()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
