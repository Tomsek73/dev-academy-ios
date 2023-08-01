//
//  MapPlaceView.swift
//  DevAcademy
//
//  Created by Tomáš Zatloukal on 01.08.2023.
//

import SwiftUI

import SwiftUI
import MapKit

struct MapPlaceView: View {
   let feature: Feature
        
    
        // 2
    @State private var mapType: MKMapType = .standard

    var body: some View {
        VStack{
            ZStack {
                // 3
                
                MapViewUIKit(region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: feature.geometry.latitude, longitude: feature.geometry.longitude) , span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), mapType: mapType)
                    
                
                VStack {
                    Spacer()
                    Picker("", selection: $mapType) {
                        Text("Standard").tag(MKMapType.standard)
                        Text("Satellite").tag(MKMapType.satellite)
                        Text("Hybrid").tag(MKMapType.hybrid)
                    }
                    .padding(.all)
                    .pickerStyle(SegmentedPickerStyle())
                    .font(.largeTitle)
                }
                
            }
            .frame(width: .infinity, height: 400, alignment: .top)
            Spacer()
        }
    }
}


struct MapPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        MapPlaceView(feature: Features.mock.features[0])
    }
}
