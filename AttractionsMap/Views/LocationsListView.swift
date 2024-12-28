

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                HStack{
                    if let imageName = location.imageNames.first
                    {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 45, height: 45)
                            .cornerRadius(10)
                    }
                    VStack(alignment: .leading){
                        Text(location.name)
                            .font(.headline)
                        Text(location.cityName)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationViewModel())
}
