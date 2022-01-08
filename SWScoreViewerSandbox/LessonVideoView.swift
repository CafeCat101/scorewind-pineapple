//
//  LessonVideoView.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/6.
//

import SwiftUI
import AVKit

struct LessonVideoView: View {
	//var getVieoLink = ""
	@EnvironmentObject var scorewindData:ScorewindData
	var viewModel:ViewModel
	@Binding var showScore:Bool
	
	var body: some View {
		VStack{
			VideoPlayer(player: AVPlayer(url:URL(string: decodeVideoURL(videoURL: scorewindData.currentLesson.video))!))
			HStack {
				Button(action: {
					showScore = true
					self.viewModel.zoomInPublisher.send("Zoom In")
				}) {
					Text("(v)+")
				}
				
				Button(action: {
					showScore = true
					self.viewModel.zoomInPublisher.send("Zoom Out")
				}) {
					Text("(v)-")
				}
				
				Button(action: {
					showScore = true
					self.viewModel.highlightBar += 1
					self.viewModel.valuePublisher.send(String(self.viewModel.highlightBar))
				}) {
					Text("(v)bar")
				}
			}
		}
	}
	
	private func decodeVideoURL(videoURL:String)->String{
		let decodedURL = videoURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
		//print(decodedURL)
		return decodedURL
	}
}

struct LessonVideoView_Previews: PreviewProvider {
	static var previews: some View {
		LessonVideoView(viewModel: ViewModel(), showScore: .constant(false))
	}
}
