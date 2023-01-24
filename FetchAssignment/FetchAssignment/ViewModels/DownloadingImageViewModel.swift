//
//  DownloadingImageViewModel.swift
//  FetchAssignment
//
//  Created by Sai Jannali on 1/19/23.
//

import Foundation
import UIKit
import Combine

class DownloadingImageViewModel: ObservableObject{
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    let cacheManager = ImageCacheManager.instance
    
    let urlString: String
    let imageKey: String
    
    init(url: String, key: String){
        urlString = url
        imageKey = key
        getImage()
    }
    
    func getImage() {
        if let savedImage = cacheManager.get(key: imageKey) {
            image = savedImage
        } else{
            downloadImage()
        }
    }
    

    func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                guard
                    let self = self,
                    let returnedImage = returnedImage else {return}
                
                self.image = returnedImage
                self.cacheManager.add(key: self.imageKey, value: returnedImage)
            }
            .store(in: &cancellables)
    }
}
