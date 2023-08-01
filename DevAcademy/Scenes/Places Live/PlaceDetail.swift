//
//  PlaceDetail.swift
//  DevAcademy
//
//  Created by Tomáš Zatloukal on 01.08.2023.
//

import SwiftUI

struct PlaceDetail: View {
    let feature: Feature
    var body: some View {
        NavigationStack{
            VStack{
                MapPlaceView(feature: feature)
            }
            .navigationTitle(feature.properties.nazev)
            
        }
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(feature: Features.mock.features[0])
    }
}
