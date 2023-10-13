//
//  AddLocationViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-06.
//

import Combine
import Foundation

@MainActor
internal final class AddLocationViewModel: ObservableObject {
    
    // MARK: - Types
    
    enum State: Equatable {
        case empty
        case querying
        case message(String)
        case results([AddLocationCellViewModel])
    }
    
    // MARK: - Properties

    private let store: Store
    private let geocodingService: GeocodingService
    
    @Published private(set) var state: State = .empty
    
    @Published var query = ""
    @Published private var isQuerying = false
    
    @Published private(set) var locations: [Location] = []
    
    
    var textFieldPlaceholder: String {
        "Enter the name of a city..."
    }
    
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Initialization
    
    init(
        store: Store,
        geocodingService: GeocodingService
    ) {
        self.store = store
        self.geocodingService = geocodingService
        
        setupBinding()
    }
    
    //MARK: Public API
    
    func addLocation(with id: String) {
        guard let location = locations.first(where: { $0.id == id }) else {
            return
        }
        do {
            try store.addLocation(location)
        } catch {
            print("Unable to Add Location \(error)")
        }
    }
    
    // MARK: - Helper Methods
    
    private func setupBinding() {
        $query
            .throttle(for: 1.0, scheduler: RunLoop.main, latest: true) // only one value is published per second
            .filter { !$0.isEmpty }
            .sink { [weak self] addressString in
            self?.geocodeAddressString(addressString)
        }.store(in: &subscriptions)
        
        /// Here we listen to changes on the locations array, we map the array to a list of viewModels,
        /// That result is then combined with the published properties $query and $isQuerying,
        /// With map we access the new values of each property when changed
        /// That way we manage the state property
        $locations
            .map { $0.map(AddLocationCellViewModel.init) }
            .combineLatest($query, $isQuerying)
            .map { viewModels, query, isQuerying -> State in
                if isQuerying {
                    return .querying
                }
                
                if query.isEmpty {
                    return .empty
                }
                
                if viewModels.isEmpty {
                    return .message("no matches found")
                } else {
                    return .results(viewModels)
                }
            }
            .eraseToAnyPublisher()
            .removeDuplicates()
            .assign(to: &$state)
    }
    
    private func geocodeAddressString(_ addressString: String) {
        isQuerying = true
        
        Task {
            do {
                locations = try await geocodingService.geocodeAddressString(addressString)
            } catch {
                locations = []
                print("unable to Geocode \(addressString). \(error)")
            }
            
            isQuerying = false
        }
    }
}

