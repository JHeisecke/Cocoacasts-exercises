//
//  AddLocationView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-06.
//

import SwiftUI

struct AddLocationView: View {
    
    @ObservedObject private(set) var viewModel: AddLocationViewModel
    
    var showsAddLocationview: Binding<Bool>
    
    var body: some View {
        VStack {
            TextField(viewModel.textFieldPlaceholder, text: $viewModel.query)
                .padding()
            
            switch viewModel.state {
            case .empty:
                Spacer()
            case .querying:
                MessageView(style: .progressView)
            case .message(let message):
                MessageView(style: .message(message))
            case .results(let viewModels):
                List {
                    ForEach(viewModels) { cellViewModel in
                        AddLocationCellView(viewModel: cellViewModel) {
                            viewModel.addLocation(with: cellViewModel.id)
                            showsAddLocationview.wrappedValue.toggle()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddLocationView(viewModel: AddLocationViewModel(geocodingService: GeocodingPreviewClient()), showsAddLocationview: .constant(false))
}

fileprivate struct MessageView: View {
    
    enum Style {
        case progressView
        case message(String)
    }
    
    let style: Style
    
    var body: some View {
        VStack {
            Spacer()
            switch style {
            case .progressView:
                ProgressView()
            case .message(let message):
                Text(message)
                    .font(.body)
                    .foregroundStyle(Color.darkGray)
            }
            Spacer()
        }
    }
}
