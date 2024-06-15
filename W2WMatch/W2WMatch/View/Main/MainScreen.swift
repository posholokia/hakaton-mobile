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
            
            Text("Hello, World!")
            Button("Logout") {
                mainVm.logout()
            }
        }
    }
}

#Preview {
    MainScreen()
}
