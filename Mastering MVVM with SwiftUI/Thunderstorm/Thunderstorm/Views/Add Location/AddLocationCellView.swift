//
//  AddLocationCellView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-06.
//

import SwiftUI

struct AddLocationCellView: View {
    
    let viewModel: AddLocationCellViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.name)
                .font(.headline)
                .foregroundStyle(Color.accentColor)
            Text(viewModel.country)
                .font(.subheadline)
                .foregroundStyle(.gray)
            Text(viewModel.coordinates)
                .font(.caption)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    AddLocationCellView(viewModel: .init(location: Location.preview))
}
