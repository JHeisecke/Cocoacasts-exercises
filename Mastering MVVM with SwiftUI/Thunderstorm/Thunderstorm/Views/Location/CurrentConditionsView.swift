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
        Text("Current Conditions")
    }
}

struct CurrentConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentConditionsView(viewModel: .init())
    }
}
