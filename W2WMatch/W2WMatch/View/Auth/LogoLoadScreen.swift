//
//  LogoLoadScreen.swift
//  W2WMatch
//
//  Created by Игорь Крысин on 20.06.2024.
//

import SwiftUI

struct LogoLoadScreen: View {
    let brandView = BrandPictureSelecterView(photoItem: GalleryItem())
    var photoData: Data?
    @State private var navigateToNextView = false
    @State var text = ""
    @State var user = AutorizedUser()
    @EnvironmentObject var mainVM: MainViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Ваш логотип")
                    .foregroundColor(Color("W2wBlueColor"))
                    .font(.custom("PoiretOne-Regular", size: 34))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .frame(width: geometry.size.width - 80)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 18)
                
                Text("Загрузите, пожалуйста, логотип вашего бренда")
                    .font(Font.custom("Manrope", size: 14))
                    .tracking(0.28)
                    .foregroundColor(Color("W2wBlueColor"))
                    .padding(.bottom, 8)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                brandView
                
                NavigationLink(destination: PersonPhotoScreen(user: user), isActive: $navigateToNextView) {
                    EmptyView()
                }
                Button("Далее") {
                    self.navigateToNextView = true
                    if let photoData = photoData {
                        mainVM.handleImageNavigation(photoData: photoData) { base64String in
                            self.text = base64String
                            
                            print(1)
                        }
                    } else {
                        print("No photo data avilable")
                    }
                    
                }
                .frame(width: 250, height: 45.0)
                .foregroundStyle(.white)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("W2wLightBlueColor"))
                }
               
                Image("Vector")
                    .padding(.top, 130)
            }
            .frame(width: geometry.size.width - 120, height: geometry.size.height)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        Spacer()
    }
}

#Preview {
    LogoLoadScreen()
}
