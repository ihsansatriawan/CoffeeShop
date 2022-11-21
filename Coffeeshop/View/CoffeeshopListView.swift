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
                /*@START_MENU_TOKEN@*/Text(result.image)/*@END_MENU_TOKEN@*/
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
