//
//  AddLocationView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-06.
//

import SwiftUI

struct AddLocationView: View {
    
    @ObservedObject var viewModel: AddLocationViewModel
    
    var showsAddLocationview: Binding<Bool>
    
    var body: some View {
        VStack {
            TextField(viewModel.textFieldPlaceholder, text: $viewModel.query)
                .padding()
            
            List {
                ForEach(viewModel.addLocationCellViewModels) { cellViewModel in
                    AddLocationCellView(viewModel: cellViewModel) {
                        viewModel.addLocation(with: cellViewModel.id)
                        showsAddLocationview.wrappedValue.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    AddLocationView(viewModel: AddLocationViewModel(), showsAddLocationview: .constant(false))
}
