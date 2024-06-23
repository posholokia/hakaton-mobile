//
//  PersonPhotoScreen.swift
//  W2WMatch
//
//  Created by Игорь Крысин on 22.06.2024.
//

import SwiftUI

struct PersonPhotoScreen: View {
    let brandView = BrandPictureSelecterView(photoItem: GalleryItem())
    var photoData: Data?
    @State var text = ""
    @State var user = AutorizedUser()
    @EnvironmentObject var mainVM: MainViewModel
   
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Ваше персональное фото")
                    .foregroundColor(Color("W2wBlueColor"))
                    .font(.custom("PoiretOne-Regular", size: 34))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .frame(width: geometry.size.width - 80)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 18)
                
                Text("Загрузите, пожалуйста, ваше фото")
                    .font(Font.custom("Manrope", size: 14))
                    .tracking(0.28)
                    .foregroundColor(Color("W2wBlueColor"))
                    .padding(.bottom, 8)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                brandView
                
            
                
                Button("Далее") {

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
    PersonPhotoScreen()
}
