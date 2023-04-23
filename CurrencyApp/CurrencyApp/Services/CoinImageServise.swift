//
//  CoinImageServise.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 18/4/23.
//

import SwiftUI
import Combine

final class CoinImageServise {
    @Published var image: UIImage? = nil
   private  var imageSubscription: AnyCancellable?
    private let coin : CoinModel
    
    init (coin: CoinModel) {
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage() {
        // download images from the internet
        
        guard let url = URL(string: coin.image) else { return }
        
        
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ data in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
