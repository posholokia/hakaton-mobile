//
//  PhotoView.swift
//  W2WMatch
//
//  Created by Игорь Крысин on 19.06.2024.
//

import SwiftUI

struct PhotoView: View {
    var photoData: Data?
    @State var text = ""
    var body: some View {
        if let photoData, let uiImage = UIImage(data: photoData) {
            let imageSize = 80.00
            
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .cornerRadius(10)
                .offset(y: -10)
            
        } else {
            let imageSize = 100.00
            
            //            Image(.downloadImageView)
            //               .foregroundColor(.accentColor)
            //               .font(.system(size: imageSize))
            
            
        }
        Button("Готово") {
            if let photoData, let uiImage = UIImage(data: photoData) {
                let img = uiImage
                let base64 = img.base64
                let rebornImg = base64?.imageFromBase64
                guard let rebornImg = rebornImg else { return }
                
                self.text = img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
                
                print("Base 64 string:", rebornImg)
                print(text)
            }
        }
        .frame(width: 250, height: 45.0)
        .foregroundStyle(.white)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("W2wLightBlueColor"))
        }
        .offset(y: 120)
    }
}

#Preview {
    PhotoView()
}




