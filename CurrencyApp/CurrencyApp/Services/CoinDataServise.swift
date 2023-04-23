//
//  CoinDataServise.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 7/4/23.
//

import Foundation
import Combine

class CoinDataServise {
    @Published var allCoins: [CoinModel] = []
    var coinSubscription : AnyCancellable?
    init () {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24&locale=en") else { return }
        
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
           
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedCoints in
                self?.allCoins = returnedCoints
                self?.coinSubscription?.cancel()
            })
    }
}
