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
            switch viewModel.state {
            case .fetching:
                ProgressView()
            case .data(let currentConditionsViewModel, let forecastViewModel):
                CurrentConditionsView(
                    viewModel: currentConditionsViewModel
                )
                Divider()
                ForecastView(
                    viewModel: forecastViewModel
                )
            case .error(let message):
                Text(message)
                    .padding()
                    .foregroundStyle(Color.accentColor)
                    .multilineTextAlignment(.center)
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
        Group{
            NavigationView {
                LocationView(viewModel: LocationViewModel(location: .preview, weatherService: WeatherPreviewClient()))
            }
            
            NavigationView {
                LocationView(viewModel: LocationViewModel(location: .preview, weatherService: WeatherPreviewClient(result: .failure(.init()))))
            }
        }
    }
}
