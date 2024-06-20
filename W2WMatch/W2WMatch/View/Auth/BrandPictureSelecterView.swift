//
//  BrandPictureSelecterView.swift
//  W2WMatch
//
//  Created by Игорь Крысин on 19.06.2024.
//

import SwiftUI
import PhotosUI

struct BrandPictureSelecterView: View {
    @State private var photosPickerItem: PhotosPickerItem?
    @ObservedObject var photoItem: GalleryItem
    @MainActor @State private var isLoading = false
    
    let filter: PHPickerFilter = .not(.videos)
    
    var body: some View {
        ZStack {
            PhotosPicker(selection: $photosPickerItem, matching: filter) {
                Label("", image: "downloadImageView")
            }
            
            PhotoView(photoData: photoItem.PhotoData)
                .padding()
            
            if isLoading {
                ProgressView()
                    .tint(.accentColor)
            }
        }
        .padding()
        .onChange(of: photosPickerItem) { selectedPhotosPickerItem in
            guard let selectedPhotosPickerItem else {
                return
            }
            
            Task {
                isLoading = true
                await updatePhotosPickerItem(with: selectedPhotosPickerItem)
                isLoading = false
            }
        }
    }
}

extension BrandPictureSelecterView {
      // MARK: Private Functions
    private func updatePhotosPickerItem(with item: PhotosPickerItem) async {
        photosPickerItem = item

        if let photoData = try? await item.loadTransferable(type: Data.self) {
            photoItem.PhotoData = photoData
        }
    }
}

#Preview {
    BrandPictureSelecterView(photoItem: GalleryItem())
}
