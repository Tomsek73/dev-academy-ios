//
//  MapViewUIKit.swift
//  DevAcademy
//
//  Created by Tomáš Zatloukal on 01.08.2023.
//

import SwiftUI
import MapKit

struct MapViewUIKit: UIViewRepresentable {

    let region: MKCoordinateRegion
    let mapType : MKMapType
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: false)
        mapView.mapType = mapType
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType
    }
}
