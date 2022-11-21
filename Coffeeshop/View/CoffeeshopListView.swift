//
//  CoffeeshopListView.swift
//  Coffeeshop
//
//  Created by ihsan.satriawan on 21/11/22.
//

import SwiftUI

struct CoffeeshopListView: View {
    // MARK: - PROPERTIES

    private var coffeeSearchResults: [Coffeeshop] {
        return CoffeeshopProvider.all()
    }
    
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List(coffeeSearchResults) { result in
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
//                /*@START_MENU_TOKEN@*/Text(result.image)/*@END_MENU_TOKEN@*/
            } //: List CoffeeSearch
            .navigationTitle("Coffeeshop")
        } //: NAVIGATION
    } //: View
}


// MARK: - PREVIEW
struct CoffeeshopListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeshopListView()
    }
}
