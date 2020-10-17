//
//  ImageListCellFooterView.swift
//  iRouming
//
//  Created by Lope on 26/07/2019.
//  Copyright © 2019 Lost Bytes. All rights reserved.
//

import SwiftUI

struct ImageListCellFooterView : View {

	let roumingImage: RoumingImage
	let isLoggedIn: Bool

    var body: some View {

			HStack {
				HStack {
					if isLoggedIn {
						ImageListCellFooterRatingLoggedInView(roumingImage: roumingImage, lightContent: false)
					} else {
						ImageListCellFooterRatingView(roumingImage: roumingImage, lightContent: false)
					}

					Spacer()
				}

				CommentsButton(commentsCount: roumingImage.commentsCount) {
					print("tapped comments")
				}

				HStack {
					Spacer()

					Button(action: {
						print("tap download")
					}, label: {
						Image("icn_download")
							.frame(width: 24, height: 24, alignment: .center)
							.foregroundColor(.textGray)
					})
					.frame(width: 44, height: 44, alignment: .center)

					Spacer()

					ShareButton {
						print("tap share")
					}
				}
				
			}.padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
			.background(Color.white)

    }
}

struct ImageListCellFooterView_Previews: PreviewProvider {
	static var previews: some View {
		ImageListCellFooterView(roumingImage: RoumingImage(name: "Tajemstvi uspechu podle Burese", commentsCount: 245, likes: 1000, dislikes: 140),
								isLoggedIn: true)
			.previewLayout(.fixed(width: 320.0, height: 54))
		ImageListCellFooterView(roumingImage: RoumingImage(name: "Tajemstvi uspechu podle Burese", commentsCount: 245, likes: 1000, dislikes: 140),
								isLoggedIn: false)
			.previewLayout(.fixed(width: 320.0, height: 54))
		ImageListCellFooterView(roumingImage: RoumingImage(name: "Tajemstvi uspechu podle Burese", commentsCount: 245, likes: 10, dislikes: 140),
								isLoggedIn: true)
			.previewLayout(.fixed(width: 375.0, height: 54))
		ImageListCellFooterView(roumingImage: RoumingImage(name: "Tajemstvi uspechu podle Burese", commentsCount: 245, likes: 10, dislikes: 140),
								isLoggedIn: false)
			.previewLayout(.fixed(width: 375.0, height: 54))
		ImageListCellFooterView(roumingImage: RoumingImage(name: "Tajemstvi uspechu podle Burese", commentsCount: 245, likes: 10, dislikes: 1),
								isLoggedIn: true)
			.previewLayout(.fixed(width: 414.0, height: 54))
		ImageListCellFooterView(roumingImage: RoumingImage(name: "Tajemstvi uspechu podle Burese", commentsCount: 245, likes: 10, dislikes: 1),
								isLoggedIn: false)
			.previewLayout(.fixed(width: 414.0, height: 54))
	}
}
