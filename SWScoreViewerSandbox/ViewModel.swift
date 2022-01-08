//
//  ViewModel.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/8.
//

import Foundation
import Combine
class ViewModel: ObservableObject {
	var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
	var showWebTitle = PassthroughSubject<String, Never>()
	var showLoader = PassthroughSubject<Bool, Never>()
	var valuePublisher = PassthroughSubject<String, Never>()
	var loadPublisher = PassthroughSubject<String, Never>()
	var zoomInPublisher = PassthroughSubject<String, Never>()
	var score:String = ""
	var highlightBar = 1
}

// For identifiying WebView's forward and backward navigation
enum WebViewNavigation {
	case backward, forward, reload
}

// For identifying what type of url should load into WebView
enum WebUrlType {
	case localUrl, publicUrl
}
