//
//  MainPageView.swift
//  W2WMatch
//
//  Created by Floron on 07.06.2024.
//

import SwiftUI

struct MainPageView: View {
    
    @State var user: AutorizedUser?
    
    var body: some View {
        if let user = user {
            
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(user.name)
                Text(user.telegrammNik)
                Text(user.myBrand.name)
                Text(user.myBrand.tgName)
                Text(user.myBrand.shopLink)
            }
        }
        
    }
}

#Preview {
    MainPageView()
}
