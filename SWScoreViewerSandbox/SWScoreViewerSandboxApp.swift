//
//  SWScoreViewerSandboxApp.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/4.
//

import SwiftUI

@main
struct SWScoreViewerSandboxApp: App {
	@StateObject var scorewindData = ScorewindData()
	
	var body: some Scene {
		WindowGroup {
			ContentView().environmentObject(scorewindData)
		}
	}
}
