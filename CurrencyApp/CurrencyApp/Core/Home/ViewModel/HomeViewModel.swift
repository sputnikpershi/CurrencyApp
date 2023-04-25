//
//  HomeViewModel.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 5/4/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    private let dataService = CoinDataServise()
    private var cancellable = Set<AnyCancellable> ()
    init() {
        addSubscribers()
    }
    
    func addSubscribers () {
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellable)
    }
}


