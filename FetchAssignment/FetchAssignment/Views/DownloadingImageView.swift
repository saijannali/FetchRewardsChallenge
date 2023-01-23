//
//  DownloadingImageView.swift
//  FetchAssignment
//
//  Created by Sai Jannali on 1/19/23.
//

import SwiftUI

struct DownloadingImageView: View{
    
    @StateObject var loader: DownloadingImageViewModel
    
    init(url: String, key: String){
        _loader = StateObject(wrappedValue: DownloadingImageViewModel(url: url, key: key))
    }
    
    var body: some View{
        ZStack{
            if loader.isLoading{
                ProgressView()
            } else if let image = loader.image{
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Rectangle())
            }
        }
    }
}

struct DownloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImageView(url: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg", key: "1")
    }
}
