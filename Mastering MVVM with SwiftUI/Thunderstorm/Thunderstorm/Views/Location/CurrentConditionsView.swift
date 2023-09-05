//
//  CurrentConditionsView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import SwiftUI

struct CurrentConditionsView: View {
    
    let viewModel: CurrentConditionsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.temperature)
                .font(.largeTitle)
            Group {
                HStack {
                    Image(systemName: "wind")
                    Text(viewModel.windSpeed)
                }
                Spacer()
                    .frame(height: 10)
                Text(viewModel.summary)
            }
            .font(.body)
        }
        .padding()
    }
}

struct CurrentConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentConditionsView(viewModel: .init())
    }
}
