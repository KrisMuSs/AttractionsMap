

import SwiftUI
import MapKit



struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ZStack{
            
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                header
                .padding()
                Spacer()

            }
        }
    }
}

//MARK: View for List locations

extension LocationView {
    
    private var header: some View{
        VStack{
            Text(vm.mapLocations.name + " , " + vm.mapLocations.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                    .padding()
                }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color:Color.black.opacity(0.3),radius: 20, x: 0, y: 15)
    }
}


#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}

