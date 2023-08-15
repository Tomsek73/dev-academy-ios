//
//  PlacesSceneState.swift
//  DevAcademy
//
//  Created by Tomáš Zatloukal on 08.08.2023.
//

import SwiftUI

struct PlacesSceneState: DynamicProperty {
    @EnvironmentObject private var placesObject: PlacesObsevableObject
    @State var showFavourites = false
    
    var places: [Feature] {
        placesObject.features
        }
    
    var placesAreLoaded: Bool{
        !places.isEmpty
    }
    
    func fetch(){
        placesObject.loadPlaces()
    }
    
}
