//
//  AddLocationCellView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-06.
//

import SwiftUI

struct AddLocationCellView: View {
    
    let viewModel: AddLocationCellViewModel
    
    let didTapPlusButton: () -> Void
    
    var body: some View {
        HStack {
            Button {
                didTapPlusButton()
            } label: {
                Image(systemName: "plus")
                    .padding()
                    .tint(.green)
                    .frame(width: 5, height: 5)
            }
            .padding()
            .background(.white)
            Spacer()
                .frame(width: 20)
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
            Spacer()
        }
    }
}

#Preview {
    AddLocationCellView(viewModel: .init(location: Location.preview), didTapPlusButton: {
        
    })
}
