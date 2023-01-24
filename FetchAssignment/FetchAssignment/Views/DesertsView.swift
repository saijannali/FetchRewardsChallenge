//
//  DesertsView.swift
//  FetchAssignment
//
//  Created by Sai Jannali on 1/18/23.
//

import Foundation
import SwiftUI
import Combine

struct DessertsView: View {
    @StateObject var vm = DessertsViewModel(dataService: MealDataService())
    
    var body: some View {
        NavigationView{
            List{
                ForEach(vm.mealsDetailsArray) { mealDetail in
                    ZStack{
                        NavigationLink("", destination: DessertDetailsView(vm: vm, mealID: mealDetail.idMeal))
                        DessertsViewRow(mealDetail: mealDetail)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Desserts")
        }
    }
}


struct DesertsView_Previews: PreviewProvider {
    static var previews: some View {
        DessertsView()
    }
}



