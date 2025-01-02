

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
    
    //Текущий регион на карте
    //Это создаёт "пустую" область карты с начальной точкой в центре координат мира (0,0)
    @Published var  mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    //Список местоположений
    @Published var showLocationsList: Bool = false
    
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
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
}
