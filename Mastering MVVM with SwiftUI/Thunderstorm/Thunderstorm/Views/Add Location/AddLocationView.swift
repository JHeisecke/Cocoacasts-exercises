//
//  AddLocationView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-06.
//

import SwiftUI

struct AddLocationView: View {
    
    @ObservedObject var viewModel: AddLocationViewModel
    
    var body: some View {
        VStack {
            TextField(viewModel.textFieldPlaceholder, text: $viewModel.query)
                .padding()
        }
    }
}

#Preview {
    AddLocationView(viewModel: AddLocationViewModel())
}
