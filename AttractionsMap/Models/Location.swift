

import SwiftUI
import MapKit

struct Location: Identifiable {
    
  //  uuidString создаст случайную строку и передаст ее в качестве идентификатора
  //  let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // Создаем вычисляемую переменную id для каждого местоположения на основе имени и названия города
    // Список мест на карте, когда два объекта с одинаковыми name и cityName будут восприниматься как одно место
    var id: String {
        // name = "Collosseum"
        // cityName = "Rome"
        // id = "CollosseumRome"
        name + cityName
    }
}

