//
//  LocationCellView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-04.
//

import SwiftUI

struct LocationCell: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: LocationCellViewModel
    
    // MARK: - View
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.locationName)
                    .font(.title)
                    .foregroundColor(.accentColor)
                Text(viewModel.locationCountry)
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                if let summary = viewModel.summary {
                    Text(summary)
                }
            }
            Spacer()
            if let temperature = viewModel.temperaute, let windSpeed = viewModel.windSpeed {
                VStack(alignment: .trailing) {
                    HStack {
                        Image(systemName: "thermometer")
                            .foregroundColor(.gray)
                        Text(temperature)
                    }
                    HStack {
                        Image(systemName: "wind")
                            .foregroundColor(.gray)
                        Text(windSpeed)
                    }
                    Spacer()
                }
            } else {
                ProgressView()
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray)
                .opacity(0.25)
        }
        .task {
            await viewModel.start()
        }
    }
}

struct LocationCellView_Previews: PreviewProvider {
        
    static var previews: some View {
        let viewModel = LocationCellViewModel(
            location: .preview,
            weatherService: WeatherPreviewClient()
        )
        
        LocationCell(viewModel: viewModel)
    }
}
