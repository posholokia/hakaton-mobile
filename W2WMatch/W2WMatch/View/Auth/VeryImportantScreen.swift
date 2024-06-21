//
//  InterectionFormatScreen.swift
//  W2WMatch
//
//  Created by Игорь Крысин on 17.06.2024.
//

import SwiftUI

struct VeryImportantScreen: View {
    
    @State var user = AutorizedUser()
    @EnvironmentObject var mainVm: MainViewModel
    
    let options = ["Рост продаж", "Новая аудитория и охваты в соцсетях", "Повышение узнаваемоести и лояльности", "Совместное творчество и усиление навыков команды", "Другое"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("И последний, самый важный")
                    .foregroundColor(Color("W2wBlueColor"))
                    .font(.custom("PoiretOne-Regular", size: 34))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .frame(width: geometry.size.width - 80)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 18)
                
                Text("Цель коллаборации")
                    .font(Font.custom("Manrope", size: 14))
                    .tracking(0.28)
                    .foregroundColor(Color("W2wBlueColor"))
                    .padding(.bottom, 8)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Выберите один или несколько вариантов")
                    .font(Font.custom("Manrope", size: 12))
                    .tracking(0.28)
                    .foregroundColor(Color("SecondaryText"))
                    .padding(.bottom, 24)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(options, id: \.self) { option in
                    TableRow(text: option)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                NavigationLink(destination: LastAuthScreen(user: user)) {
                    Text("Далее")
                    //надо передать данные на сервер
                }
                .frame(width: geometry.size.width - 120, height: 45.0)
                .foregroundStyle(.white)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("W2wLightBlueColor"))
                }
                .padding(.top)
                
                Image("Vector")
                    .padding(.top, 20)
            }
            .frame(width: geometry.size.width - 120, height: geometry.size.height)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        Spacer()
    }
}


#Preview {
    VeryImportantScreen(user: AutorizedUser())
}


