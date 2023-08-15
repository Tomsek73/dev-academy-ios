import SwiftUI

struct ContentView: View {
    var body: some View {
        PlacesScene()
            .environmentObject(PlacesObsevableObject())
            .environmentObject(Coordinator())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
