//
//  ImageListCell.swift
//  iRouming
//
//  Created by Lope on 29/06/2019.
//  Copyright © 2019 Lost Bytes. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageListCell: View {

	@ObservedObject var imageLoader: ImageLoader
	@State var isImageLoaded = false

	@State private var selectedImage: RoumingImage?
	@State private var commentsImage: RoumingImage?

	var image: RoumingImage
	@State var imageData: UIImage?

	init(image: RoumingImage) {
		self.image = image
		imageLoader = ImageLoader(url: image.urlThumbnail)
	}

	var body: some View {
		VStack(spacing: 0) {

			HeaderView(headerData: image.headerData)

			WebImage(url: URL(string: image.urlImage), options: [.queryMemoryData])
				.onSuccess { image, data, cacheType in
					imageData = image
				}

				.resizable()
				.placeholder {
					Rectangle()
						.foregroundColor(.gray)
						.opacity(0.1)
				}
				.transition(.fade(duration: 0.5))
				.scaledToFit()
				.onTapGesture {
					selectedImage = image
				}
				.fullScreenCover(item: $selectedImage, content: {
					ImageDetailView(image: $0)
				})

			ImageListCellFooterView(roumingImage: image, isLoggedIn: false, imageData: imageData, commentsImage: $commentsImage)
				.sheet(item: $commentsImage, content: {
					CommentsView(parent: $0)
				})

			if image.isLastSeen {
				LastSeenView()
			}
		}
		.onAppear {
			self.imageLoader.loadImage()
		}
	}

}

struct ImageListCell_Previews: PreviewProvider {
	static var previews: some View {
		ImageListCell(image: RoumingImage(name: "Tajemstvi uspechu podle Burese, Tajemstvi uspechu podle Burese", commentsCount: 2, likes: 10, dislikes: 140))
			.previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/375.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/498.0/*@END_MENU_TOKEN@*/))
	}
}
