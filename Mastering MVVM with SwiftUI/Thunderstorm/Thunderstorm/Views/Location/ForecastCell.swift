//
//  ForecastCellView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import SwiftUI

struct ForecastCell: View {
    
    // MARK: - Properties

    let viewModel: ForecastCellViewModel

    // MARK: - View

    var body: some View {
        Text(viewModel.temperature)
    }
}

struct ForecastCell_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCell(viewModel: .init())
    }
}
