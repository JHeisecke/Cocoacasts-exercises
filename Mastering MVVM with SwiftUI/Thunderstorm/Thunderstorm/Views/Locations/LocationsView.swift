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
    
    @State private var showsAddLocationView: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 20) {
                    Button(viewModel.addLocationTitle) {
                        showsAddLocationView.toggle()
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.accentColor)
                    .clipShape(Capsule())
                    ForEach(viewModel.locationCellViewModels) { viewModel in
                        NavigationLink {
                            LocationView(viewModel: viewModel.locationViewModel)
                        } label: {
                            LocationCell(viewModel: viewModel)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(viewModel.title)
            .sheet(isPresented: $showsAddLocationView) {
                AddLocationView(viewModel: viewModel.addLocationViewModel, showsAddLocationview: $showsAddLocationView)
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(viewModel: LocationsViewModel())
    }
}
