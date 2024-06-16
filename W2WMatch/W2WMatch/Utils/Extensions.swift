//
//  Extensions.swift
//  jwt_authorizer
//
//  Created by Lev Baklanov on 27.10.2022.
//

import Foundation
import SwiftUI


struct NavigationArrowLef: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack: some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("W2wBlueColor"))
        }
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
    }
}

extension View {
    func navigationArrowLef() -> some View {
        modifier(NavigationArrowLef())
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension HTTPURLResponse {
    
    func isSuccessful() -> Bool {
        return statusCode >= 200 && statusCode <= 299
    }
}

extension Date {
    
    init(timestampMillis: Int64) {
        self.init(timeIntervalSince1970: TimeInterval(timestampMillis/1000))
    }
    
    func timestampMillis() -> Int64 {
        return timestamp() * 1000
    }
    
    func timestamp() -> Int64 {
        return Int64(self.timeIntervalSince1970)
    }
}