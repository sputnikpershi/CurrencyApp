//
//  CoinImageViewModel.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 18/4/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    private let coin : CoinModel
    private let dataServise : CoinImageServise
    private var cancellabeles = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataServise  = CoinImageServise(coin: coin)
        self.isLoading = true
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataServise.$image
            .sink { [weak self ] (_)  in
                self?.isLoading  = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellabeles)
    }
}
