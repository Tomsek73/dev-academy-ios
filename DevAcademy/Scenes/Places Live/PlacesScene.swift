import SwiftUI
import ActivityIndicatorView

struct PlacesScene: View {
    let state = PlacesSceneState()
    @EnvironmentObject private var coordinator: Coordinator
    var body: some View {
        NavigationStack {
            Group{
                if state.placesAreLoaded {
                    List(state.places, id: \.properties.nazev) { feature in
                        NavigationLink{
                            coordinator.placeDetailScene(with: feature)
                        } label: {
                            
                            PlacesRow(feature: feature)
                        }
                            .onTapGesture {
                                tapped(on: feature)
                            }
                    }
                    .listStyle(.plain)
                } else {
                    ActivityIndicatorView(isVisible: .constant(true), type: .growingCircle)
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("Kultůrmapa")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button("Oblíbené"){
                    state.showFavourites.toggle()
                }
            }
            
            
        }
        .onAppear(perform: state.fetch)
        .sheet(isPresented: state.$showFavourites){
            coordinator.favoritesScene
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        
        
        
        
        
    }

    func tapped(on feature: Feature) {
    }

    
}


