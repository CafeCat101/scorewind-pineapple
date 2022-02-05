//
//  LessonScoreView.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/8.
//

import SwiftUI
import AVFoundation

struct LessonScoreView: View {
	var viewModel:ViewModel
	@EnvironmentObject var scorewindData:ScorewindData
	@Binding var player: AVPlayer
	
	var body: some View {
		VStack {
			WebView(url: .localUrl, viewModel: viewModel, score: scorewindData.currentLesson.scoreViewer, linkVideoPlayer: player).overlay (
				RoundedRectangle(cornerRadius: 0, style: .circular)
					.stroke(Color.gray, lineWidth: 0.5)
			).padding(.leading, 0).padding(.trailing, 0)
			
			/*Button(action: {
			 self.viewModel.loadPublisher.send(scorewindData.currentLesson.scoreViewer)
			 }) {
			 Text("XML")
			 }*/
			HStack {
				Button(action: {
					self.viewModel.zoomInPublisher.send("Zoom In")
				}) {
					Image(systemName: "plus")
						.font(.system(size: 20, weight: .regular))
						.imageScale(.large)
						.foregroundColor(.gray)
				}
				
				Button(action: {
					self.viewModel.zoomInPublisher.send("Zoom Out")
				}) {
					Image(systemName: "minus")
						.font(.system(size: 20, weight: .regular))
						.imageScale(.large)
						.foregroundColor(.gray)
				}
				
				Button(action: {
					self.viewModel.highlightBar += 1
						self.viewModel.valuePublisher.send(String(self.viewModel.highlightBar))
				}) {
						Image(systemName: "figure.walk.circle")
								.font(.system(size: 20, weight: .regular))
								.imageScale(.large)
								.foregroundColor(.gray)
				}
			}
		}
		.onAppear(perform: {
			print("LessonScoreView onAppear")
		})
	}
}

struct LessonScoreView_Previews: PreviewProvider {
	@State static var player = AVPlayer()
	static var previews: some View {
		LessonScoreView(viewModel: ViewModel(), player: $player).environmentObject(ScorewindData())
	}
}
