//
//  DessertDetailsView.swift
//  FetchAssignment
//
//  Created by Sai Jannali on 1/19/23.
//

import SwiftUI

struct DessertDetailsView: View{
    @ObservedObject var vm: DessertsViewModel
    let mealID: String
    
    @State var image: UIImage?
    
    var body: some View{
        VStack(spacing: 10) {
            if let mealDetails = vm.currDessertDetails.meals.first {
                if let image = image{
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: UIScreen.main.bounds.height/3)
                        .cornerRadius(20)
                        .overlay(alignment: .bottom) {
                            Text(mealDetails.strMeal ?? "")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding()
                                .foregroundColor(.yellow)
                                .frame(height: 44)
                                .padding(.horizontal)
                                .background(Color.black.opacity(0.3))
                            
                        }
                        .padding(.horizontal)
                }
                
                List{
                    Section(header: Text("Ingredients")){
                        ForEach(mealDetails.strIngredients.indices, id: \.self) { index in
                            HStack {
                                Text(mealDetails.strIngredients[index])
                                Text(mealDetails.strMeasures[index])
                                Text("\(index)")
                            }
                        }
                    }
                    Section(header: Text("Instructions")){
                        if let instructions = mealDetails.strInstructions {
                            Text(instructions)
                        }
                    }
                }
                .listStyle(.plain)
                
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            loadDetails()
        }
        
    }
    
    func loadDetails(){
        image = ImageModelCacheManager.instance.get(key: mealID)
        MealDeatilsModelDataService.instance.downloadDessertData(mealID: mealID)
        dump(vm.currDessertDetails)
    }
}

struct DessertDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailsView(vm: DessertsViewModel(), mealID: "1", image: UIImage())
    }
}
