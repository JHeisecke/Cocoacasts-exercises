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
        Text("Forecast")
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(viewModel: .init())
    }
}
