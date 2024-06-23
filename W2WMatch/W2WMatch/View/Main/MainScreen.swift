//
//  MainScreen.swift
//  jwt_authorizer
//
//  Created by Floron on 14.06.2024.
//

import SwiftUI

struct MainScreen: View {
    
    @EnvironmentObject var mainVm: MainViewModel
    
    var body: some View {
        
        VStack {
            
            Text("It's Main View")
            
//            if let user = mainVm.user {
//                
//                VStack {
//                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                    Text(user.name)
//                    Text(user.telegrammNik)
//                    Text(user.myBrand.name)
//                    Text(user.myBrand.tgName)
//                    Text(user.myBrand.shopLink)
//                }
//            }
            
            Button("Logout") {
                mainVm.logout()
            }
        }
    }
}

#Preview {
    MainScreen()
}
