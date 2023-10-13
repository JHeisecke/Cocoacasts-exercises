//
//  LocationView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import SwiftUI

struct LocationView: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel: LocationViewModel
    
    // MARK: View
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            if let currentConditionsViewModel = viewModel.currentConditionsViewModel,
               let forecastViewModel = viewModel.forecastViewModel {
                
                CurrentConditionsView(
                    viewModel: currentConditionsViewModel
                )
                
                Divider()
                
                ForecastView(
                    viewModel: forecastViewModel
                )
            } else {
                ProgressView()
            }
        }
        .navigationTitle(viewModel.locationName)
        .task {
            await viewModel.start()
        }
    }
}

// MARK: - Previews

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationView(viewModel: LocationViewModel(location: .preview, weatherService: WeatherPreviewClient()))
        }
    }
}
