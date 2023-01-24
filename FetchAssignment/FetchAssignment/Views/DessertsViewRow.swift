//
//  DessertsViewRow.swift
//  FetchAssignment
//
//  Created by Sai Jannali on 1/19/23.
//

import SwiftUI

struct DessertsViewRow: View{
    
    let mealDetail: CategoryDetails
    
    var body: some View{
        HStack{
            DownloadingImageView(url: mealDetail.strMealThumb, key: mealDetail.idMeal)
                .frame(width: 100, height: 100)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Text(mealDetail.strMeal)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
    
struct DessertsViewRow_Previews: PreviewProvider {
    static var previews: some View {
        DessertsViewRow(mealDetail: CategoryDetails(strMeal: "sample", strMealThumb: "https://sample.com", idMeal: "1"))
    }
}
