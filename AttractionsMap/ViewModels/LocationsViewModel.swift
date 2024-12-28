

import SwiftUI
import MapKit

class LocationViewModel: ObservableObject {
    
    //Все местоположения на карте
    @Published var locations: [Location]
    
    //Текущее местоположение на карте
    @Published var mapLocations: Location
    {
        didSet {
            updateMapRegion(locations: mapLocations)
        }
    }
     
    //Это создаёт "пустую" область карты с начальной точкой в центре координат мира (0,0)
    @Published var  mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    //Заранее определим диапазон для карты
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocations = locations.first!
        self.updateMapRegion(locations: locations.first!)
    }
    
    private func updateMapRegion(locations: Location) {
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: locations.coordinates,
                span: mapSpan)
        }
    }
}
