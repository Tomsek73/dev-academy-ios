//
//  Coordinator.swift
//  DevAcademy
//
//  Created by Tomáš Zatloukal on 08.08.2023.
//

import SwiftUI

final class Coordinator: ObservableObject{
    
    var placesScene: some View{
        PlacesScene()
    }
    
    func placeDetailScene(with feature: Feature) -> some View {
        PlaceDetail(feature: feature)
    }
    
    var favoritesScene: some View {
            Text("Zatím tady nic není")
    }
}
