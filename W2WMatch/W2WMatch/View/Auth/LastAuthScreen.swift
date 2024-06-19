//
//  LastAuthScreen.swift
//  W2WMatch
//
//  Created by Игорь Крысин on 19.06.2024.
//

import SwiftUI

struct LastAuthScreen: View {
    @State var user = AutorizedUser()
    let brandView = BrandPictureSelecterView(photoItem: GalleryItem())
    let options = ["Рост продаж", "Новая аудитория и охваты в соцсетях", "Повышение узнаваемоести и лояльности", "Совместное творчество и усиление навыков команды", "Другое"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Остается только показать всем ваш продукт")
                    .foregroundColor(Color("W2wBlueColor"))
                    .font(.custom("PoiretOne-Regular", size: 34))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .frame(width: geometry.size.width - 80)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 18)
                
                Text("Загрузите, пожалуйста. фото, иллюстрирующее Ваш продукт (товар или услугу)")
                    .font(Font.custom("Manrope", size: 14))
                    .tracking(0.28)
                    .foregroundColor(Color("W2wBlueColor"))
                    .padding(.bottom, 8)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                brandView
               
              
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
    LastAuthScreen(user: AutorizedUser())
}




