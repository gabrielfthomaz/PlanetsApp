//
//  ContentViewModel.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 20/09/24.
//

import Foundation


import Combine


final class CVM: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var stateModel: UIStateModel = UIStateModel()
    @Published private(set) var activeCard: Int = 0
    private var cancellables: [AnyCancellable] = []
    
    // MARK: - Lifecycle
    
    init() {
            self.stateModel.$activeCard.sink { completion in
                switch completion {
                case let .failure(error):
                    print("finished with error: ", error.localizedDescription)
                case .finished:
                    print("finished")
                }
            } receiveValue: { [weak self] activeCard in
                self?.someCoolMethodHere(for: activeCard)
            }.store(in: &cancellables)
        }
    
    // MARK: - Helpers
    
    private func someCoolMethodHere(for activeCard: Int) {
        print("someCoolMethodHere: index received: ", activeCard)
        self.activeCard = activeCard
    }
}
