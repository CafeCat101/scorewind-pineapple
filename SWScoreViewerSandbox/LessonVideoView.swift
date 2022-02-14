//
//  LessonVideoView.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/6.
//(This file is not use now. video is moved to LessonView)

import SwiftUI
import AVKit

struct LessonVideoView: View {
	//var getVieoLink = ""
	@EnvironmentObject var scorewindData:ScorewindData
	var viewModel:ViewModel
	@Binding var showScore:Bool
	@Binding var player:AVPlayer
	@State private var watchTime:String = ""
	
	var body: some View {
		VStack{
			//VideoPlayer(player: AVPlayer(url:URL(string: decodeVideoURL(videoURL: scorewindData.currentLesson.video))!))
			VideoPlayer(player: player)
				.onAppear(perform: {
					player = AVPlayer(url: URL(string: decodeVideoURL(videoURL: scorewindData.currentLesson.video))!)
					
					player.addPeriodicTimeObserver(forInterval: CMTime(value: 1, timescale: 2), queue: .main, using: { time in
						//print(time)
						//print(createTimeString(time: Float(time.seconds)))
						watchTime = createTimeString(time: Float(time.seconds))
						//self.viewModel.valuePublisher.send(String(String(format: "%.4f", Float(time.seconds))))
						watchTime = String(format: "%.4f", Float(time.seconds))//createTimeString(time: Float(time.seconds))
					})
				})
			HStack {
				Text("watchTime:"+watchTime)
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
				
				Button(action: {
					showScore = true
					//scorewind timestamp ex(s): 5.917
					player.seek(to:CMTimeMake(value: 5917, timescale: 1000))
				}) {
					Text("Seek")
				}
			}
		}
	}
	
	private func decodeVideoURL(videoURL:String)->String{
		let decodedURL = videoURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
		//print(decodedURL)
		return decodedURL
	}
	
	private func createTimeString(time: Float) -> String {
		let timeRemainingFormatter: DateComponentsFormatter = {
			let formatter = DateComponentsFormatter()
			formatter.zeroFormattingBehavior = .pad
			formatter.allowedUnits = [.minute, .second]
			return formatter
		}()
		
		let components = NSDateComponents()
		components.second = Int(max(0.0, time))
		return timeRemainingFormatter.string(from: components as DateComponents)!
	}

}
/*
struct LessonVideoView_Previews: PreviewProvider {
	static var previews: some View {
		LessonVideoView(viewModel: ViewModel(), showScore: .constant(false))
	}
}*/
