//
//  ViewModel.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/8.
//

import Foundation
import Combine
import AVKit
class ViewModel: ObservableObject {
	var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
	var showWebTitle = PassthroughSubject<String, Never>()
	var showLoader = PassthroughSubject<Bool, Never>()
	var valuePublisher = PassthroughSubject<String, Never>()
	var loadPublisher = PassthroughSubject<String, Never>()
	var zoomInPublisher = PassthroughSubject<String, Never>()
	var timestampPublisher = PassthroughSubject<String, Never>()
	var score:String = ""
	var highlightBar = 1
	var videoPlayer: AVPlayer?
	
	func playerGoTo(){
		print("playerGoTo()[ViewModel]")
		let seekTime = CMTime(value: 17509, timescale: 1000)
		videoPlayer?.seek(to: CMTime(seconds: Double(17.409).rounded(.toNearestOrEven), preferredTimescale: 1000))
		print("ViewModel playerGoTo "+String(CMTimeGetSeconds(seekTime)))
		//videoPlayer?.seek(to:seekTime)
		videoPlayer?.play()
	}
}

// For identifiying WebView's forward and backward navigation
enum WebViewNavigation {
	case backward, forward, reload
}

// For identifying what type of url should load into WebView
enum WebUrlType {
	case localUrl, publicUrl
}

