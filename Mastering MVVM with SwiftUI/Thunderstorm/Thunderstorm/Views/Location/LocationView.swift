//
//  LocationView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import SwiftUI

struct LocationView: View {
    
    // MARK: Properties
    
    let viewModel: LocationViewModel
    
    // MARK: View
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            CurrentConditionsView(
                viewModel: viewModel.currentConditionsViewModel
            )
            ForecastView(
                viewModel: viewModel.forecastViewModel
            )
        }
    }
}

// MARK: - Previews

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(viewModel: LocationViewModel(location: .preview))
    }
}
