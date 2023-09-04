//
//  LocationsView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-04.
//

import SwiftUI

struct LocationsView: View {
    
    // MARK: - Properties
    
    let viewModel: LocationsViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 20) {
                    ForEach(viewModel.locationCellViewModels) { viewModel in
                        LocationCell(viewModel: viewModel)
                    }
                }
                .padding()
            }
            .navigationTitle(viewModel.title)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(viewModel: LocationsViewModel())
    }
}
