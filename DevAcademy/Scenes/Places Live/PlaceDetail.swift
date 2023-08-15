//
//  PlaceDetail.swift
//  DevAcademy
//
//  Created by Tomáš Zatloukal on 01.08.2023.
//

import SwiftUI
import MapKit
struct PlaceDetail: View {
    let feature: Feature
    var body: some View {
        ScrollView{
            
            VStack{
                Text(feature.properties.druh.rawValue)
                    .font(.title2)
                
                Spacer(minLength: 20)
                AsyncImage(url: feature.properties.obrId1){
                    image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                        
                        
                } placeholder: {
                    ProgressView()
                }
                .padding(.horizontal)
                MapPlaceView(feature: feature)
                    .frame(height: 300)
                
            }
            .navigationTitle(feature.properties.nazev)
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
        
        
        
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(feature: Features.mock.features[0])
    }
}
