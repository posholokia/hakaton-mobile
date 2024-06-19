//
//  BrandPictureSelecterView.swift
//  W2WMatch
//
//  Created by Floron on 19.06.2024.
//

import SwiftUI
import PhotosUI

struct BrandPictureSelecterView: View {
    @State private var photosPickerItem: PhotosPickerItem?
    let filter: PHPickerFilter = .not(.videos)
    
    var body: some View {
        VStack {
                   PhotosPicker(selection: $photosPickerItem, matching: filter) {
                     Label("Select Photo", systemImage: "photo")
                   }
               }
               .padding()
        
        Button("Done") {
            let img = UIImage()
            let base64 = img.base64
            let rebornImg = base64?.imageFromBase64
        }
    }
}
 

#Preview {
    BrandPictureSelecterView()
}




extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}
