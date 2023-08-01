import SwiftUI
import ActivityIndicatorView

struct PlacesScene: View {
    @State var features: [Feature] = []
    @State var showFavourites = false
    var body: some View {
        NavigationStack {
            Group{
                if !features.isEmpty {
                    List(features, id: \.properties.nazev) { feature in
                        NavigationLink{
                            PlaceDetail(feature: feature)
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
                    showFavourites.toggle()
                }
            }
            
            
        }
        .onAppear(perform: fetch)
        .sheet(isPresented: $showFavourites){
            Text("Zatím nic")
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        
        
        
        
        
    }

    func tapped(on feature: Feature) {
    }

    func fetch() {
        DataService.shared.fetchData { result in
            switch result {
            case .success(let features):
                self.features = features.features
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct PlacesScene_Previews: PreviewProvider {
    static var previews: some View {
        PlacesScene()
    }
}
