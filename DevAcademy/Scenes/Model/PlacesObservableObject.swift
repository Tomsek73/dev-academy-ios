//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Tomáš Zatloukal on 08.08.2023.
//

import SwiftUI

final class PlacesObsevableObject: ObservableObject{
    @Published var features: [Feature] = []
    
    
    private let dataService: DataService = DataService.shared
    
    func loadPlaces(){
        dataService.fetchData { result in
            switch result {
            case .success(let features):
                self.features = features.features
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
