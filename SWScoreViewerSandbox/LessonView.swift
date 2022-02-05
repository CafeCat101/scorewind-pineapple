//
//  LessonView.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/5.
//

import SwiftUI
import AVKit

struct LessonView: View {
	@State private var showNavigationGuide = false
	@State private var goToView = "lesson"
	@EnvironmentObject var scorewindData:ScorewindData
	let screenSize: CGRect = UIScreen.main.bounds
	@ObservedObject var viewModel = ViewModel()
	@State private var showScore = false
	@State private var startPos:CGPoint = .zero
	@State private var isSwipping = true
	@State private var player = AVPlayer()
	//@State private var playerModel = PlayerViewModel()
	
	var body: some View {
		if goToView == "lesson" {
			VStack{
				Button(action: {
					showNavigationGuide = true
				}) {
					Text("\(scorewindData.currentLesson.title))")
						.font(.title2)
						.foregroundColor(Color.black)
				}
				
				/*LessonVideoView(viewModel: viewModel, showScore: $showScore, player: $player)
					.frame(height: screenSize.height/2.5)*/
				VideoPlayer(player: player)
					.onAppear(perform: {
						player = AVPlayer(url: URL(string: decodeVideoURL(videoURL: scorewindData.currentLesson.video))!)
						
						player.addPeriodicTimeObserver(forInterval: CMTime(value: 1, timescale: 2), queue: .main, using: { time in
							//print(time)
							print(createTimeString(time: Float(time.seconds)))
							//watchTime = createTimeString(time: Float(time.seconds))
							//self.viewModel.valuePublisher.send(String(String(format: "%.4f", Float(time.seconds))))
							//watchTime = String(format: "%.4f", Float(time.seconds))//createTimeString(time: Float(time.seconds))
						})
					})
				/*VideoPlayer(player: playerModel.player)
					.onAppear(perform: {
						playerModel.setPlayer(videoURL: scorewindData.currentLesson.video)
						
						playerModel.player!.addPeriodicTimeObserver(forInterval: CMTime(value: 1, timescale: 2), queue: .main, using: { time in
							//print(time)
							print(createTimeString(time: Float(time.seconds)))
							//watchTime = createTimeString(time: Float(time.seconds))
							self.viewModel.valuePublisher.send(String(String(format: "%.4f", Float(time.seconds))))
							//watchTime = String(format: "%.4f", Float(time.seconds))//createTimeString(time: Float(time.seconds))
						})
					})*/
				
				VStack {
					if showScore == false {
						LessonTextView()
					}else {
						LessonScoreView(viewModel: viewModel,player: $player)
					}
				}
				.gesture(
					DragGesture()
						.onChanged { gesture in
							if self.isSwipping {
								self.startPos = gesture.location
								self.isSwipping.toggle()
							}
						}
						.onEnded { gesture in
							let xDist =  abs(gesture.location.x - self.startPos.x)
							let yDist =  abs(gesture.location.y - self.startPos.y)
							if self.startPos.y <  gesture.location.y && yDist > xDist {
								//down
							}
							else if self.startPos.y >  gesture.location.y && yDist > xDist {
								//up
							}
							else if self.startPos.x > gesture.location.x && yDist < xDist {
								//left
								withAnimation{
									showScore = true
								}
							}
							else if self.startPos.x < gesture.location.x && yDist < xDist {
								//right
								withAnimation{
									showScore = false
								}
							}
							self.isSwipping.toggle()
						}
				)
				
				Spacer()
			}
			.onAppear(perform: {
				viewModel.score = scorewindData.currentLesson.scoreViewer
			})
			.sheet(isPresented: $showNavigationGuide,onDismiss: {
				viewModel.score = scorewindData.currentLesson.scoreViewer
				viewModel.highlightBar = 1
				
				player.pause()
				player.replaceCurrentItem(with: nil)
				player = AVPlayer(url: URL(string: decodeVideoURL(videoURL: scorewindData.currentLesson.video))!)
				player.addPeriodicTimeObserver(forInterval: CMTime(value: 1, timescale: 2), queue: .main, using: { time in
					//print(time)
					print(createTimeString(time: Float(time.seconds)))
					//watchTime = createTimeString(time: Float(time.seconds))
					//self.viewModel.valuePublisher.send(String(String(format: "%.4f", Float(time.seconds))))
					//watchTime = String(format: "%.4f", Float(time.seconds))//createTimeString(time: Float(time.seconds))
				})
				
				/*playerModel = PlayerViewModel()
				playerModel.setPlayer(videoURL: scorewindData.currentLesson.video)
				playerModel.player!.addPeriodicTimeObserver(forInterval: CMTime(value: 1, timescale: 2), queue: .main, using: { time in
					//print(time)
					print(createTimeString(time: Float(time.seconds)))
					//watchTime = createTimeString(time: Float(time.seconds))
					self.viewModel.valuePublisher.send(String(String(format: "%.4f", Float(time.seconds))))
					//watchTime = String(format: "%.4f", Float(time.seconds))//createTimeString(time: Float(time.seconds))
				})*/
			}){
				NavigationGuideView(isPresented: self.$showNavigationGuide, setToView: self.$goToView)
			}
		}else{
			ContentView()
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
	
	/*func callVideo(timestamp: String){
		player.play()
	}*/
}

struct LessonView_Previews: PreviewProvider {
	static var previews: some View {
		LessonView().environmentObject(ScorewindData())
	}
}
