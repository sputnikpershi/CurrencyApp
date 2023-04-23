//
//  LocalFileManager.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 23/4/23.
//

import SwiftUI

class LocalFileManager {
    static let instance  = LocalFileManager()
    init () {}
    
    
  
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        //create folder
        createFolderIfNeeded(folderName: folderName)
        
        //get path for image
        guard let data = image.pngData() else {return}
        let fileUrl = getUrlForImage(imageName: imageName, folderName: folderName)
        
        //save image to path
        do {
            try? data.write(to: fileUrl!)
        } catch let error {
            print("error saving image. Image name \(imageName). \(error)")
        }
    }
    
    func getImage (imageName:String, folderName: String) -> UIImage? {
        guard let url  = getUrlForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path()) else {
            return nil }
        
        return UIImage(contentsOfFile: url.path())
    }
    
    private func getUrlForFolder (folderName: String ) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName)
    }
    
    private func getUrlForImage (imageName: String, folderName: String ) -> URL? {
        guard  let folderURL = getUrlForFolder(folderName: folderName) else { return nil}
        return folderURL.appendingPathComponent(imageName + ".png")
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getUrlForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path()) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("error create directory. Folder name \(folderName) . \(error)")
            }
        }
    }
}
