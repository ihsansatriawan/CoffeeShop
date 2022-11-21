//
//  CoffeeshopListView.swift
//  Coffeeshop
//
//  Created by ihsan.satriawan on 21/11/22.
//

import SwiftUI

struct CoffeeshopListView: View {
    // MARK: - PROPERTIES

    @State private var coffeeSearch: String = ""
    
    private var coffeeSearchResults: [Coffeeshop] {
        let results = CoffeeshopProvider.all()
        
        if coffeeSearch.isEmpty {
            return results
        } else {
            return results.filter {
                $0.name.lowercased().contains(coffeeSearch.lowercased()) || $0.location.lowercased().contains(coffeeSearch.lowercased())
            }
        }
    }
    
    private var suggestedCoffee: [Coffeeshop] {
        if (coffeeSearch.isEmpty) {
            return []
        } else {
            return coffeeSearchResults
        }
    }
    
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List(coffeeSearchResults) { result in
                NavigationLink(
                    destination: {
                        CoffeeDetailView(coffeeShopDetails: result)
                    }
                ) {
                    HStack() {
                        
                        Image(result.image)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(15)
                        
                        VStack(alignment: .leading) {
                            //TODO: Styling Text
                            
                            Text(result.name)
                                .font(.system(size: 15, design: .rounded))
                                .fontWeight(.black)
                            Text(result.location)
                                .multilineTextAlignment(.leading)
                            Text("Rating: 4/5")
                        }
                    } //: HStack
                }
                
            } //: List CoffeeSearch
            .navigationTitle("Coffeeshop")
            .searchable(
                text: $coffeeSearch,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search coffeeshops"
            ) {
                ForEach(suggestedCoffee) { coffee in
                    Text("Looking for \(coffee.name)?")
                        .searchCompletion(coffee.name)
                }
            }
        } //: NAVIGATION
    } //: View
}


// MARK: - PREVIEW
struct CoffeeshopListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeshopListView()
    }
}
