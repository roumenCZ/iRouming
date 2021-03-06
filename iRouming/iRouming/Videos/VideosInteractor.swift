//
//  VideosInteractor.swift
//  iRouming
//
//  Created by Lope on 17/10/2020.
//  Copyright © 2020 Lost Bytes. All rights reserved.
//

import Foundation

class VideosInteractor: ObservableObject {

	var videos: [Video] = []

	@Published var isLoading = false


	private var dataManager = VideosDataManager()

	func getVideos() {
		isLoading = true

		dataManager.loadVideos { videos in
			DispatchQueue.main.async {
				self.videos = videos
				self.isLoading = false
			}
		}
	}

	/*func loadNextPage() {
		if isLoading {
			return
		}

		isLoading = true
		currentPage += 1

		dataManager.loadVideos(page: currentPage) { newVideos in
			self.isLoading = false
			self.videos = self.videos + newVideos
		}
	}*/
}
