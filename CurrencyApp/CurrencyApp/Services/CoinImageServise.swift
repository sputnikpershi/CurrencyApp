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
    private var fileManager = LocalFileManager.instance
    private let folderName  = "coin_images"
    private let imageName: String
    
    init (coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getgetCoinImage()
    }
    
    private func getgetCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("retrieved image from File manager!")
        } else {
            downloadCoinImage()
            print("dowload image now!")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
