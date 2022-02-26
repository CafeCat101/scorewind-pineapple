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
	//@State private var showScoreMenu = false
	//@GestureState var press = false
	
	var body: some View {
		ZStack() {
			WebView(url: .localUrl, viewModel: viewModel, scorewindData: scorewindData)
				.padding(.leading, 0)
				.padding(.trailing, 0)
				.padding(.bottom, 0)
				.onAppear(perform: {
					print(scorewindData.timestampToJson())
				})
				//.border(.black, width: 1)
			/*ZStack(alignment: .bottom){
				WebView(url: .localUrl, viewModel: viewModel, scorewindData: scorewindData)
					.padding(.leading, 0)
					.padding(.trailing, 0)
					.onAppear(perform: {
						print(scorewindData.timestampToJson())
					})
					.border(.black, width: 1)
				HStack {
					Text("Hacking with Swift")
						.font(.largeTitle)
						.background(Color.black)
						.foregroundColor(.white)
				}
			}*/
			
			
			/*Button(action: {
			 self.viewModel.loadPublisher.send(scorewindData.currentLesson.scoreViewer)
			 }) {
			 Text("XML")
			 }*/
			/*HStack {
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
			 
			 }*/
			/*ZStack {
				HStack {
					Button(action: {
					self.viewModel.zoomInPublisher.send("Zoom In")
					}) {
					Image(systemName: "plus")
					.font(.system(size: 20, weight: .regular))
					.imageScale(.large)
					.foregroundColor(.gray)
					}
					
					Spacer()
				}
			}
			.frame(height:50)
			.background(.gray)*/
			
		}
		.edgesIgnoringSafeArea(.bottom)
		/*.gesture(
			LongPressGesture(minimumDuration: 0.5)
				.updating($press) { currentState, gestureState, transaction in
					gestureState = currentState
				}
				.onEnded { value in
					showScoreMenu.toggle()
				}
		)*/
	}
}

struct LessonScoreView_Previews: PreviewProvider {
	@State static var player = AVPlayer()
	static var previews: some View {
		LessonScoreView(viewModel: ViewModel(), player: $player).environmentObject(ScorewindData())
	}
}
