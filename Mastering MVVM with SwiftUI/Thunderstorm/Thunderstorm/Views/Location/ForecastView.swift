//
//  ForecastView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import SwiftUI

struct ForecastView: View {
    
    // MARK: - Properties
    
    let viewModel: ForecastViewModel
    
    // MARK: - View
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()]) {
                ForEach(viewModel.forecastCellViewModels) { forecastCellViewModel in
                    ForecastCell(viewModel: forecastCellViewModel)
                }
            }
            .padding()
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(viewModel: .init())
    }
}
