//
//  LessonView.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/5.
//

import SwiftUI

struct LessonView: View {
	@State private var showNavigationGuide = false
	@State private var goToView = "lesson"
	@EnvironmentObject var scorewindData:ScorewindData
	let screenSize: CGRect = UIScreen.main.bounds
	@ObservedObject var viewModel = ViewModel()
	@State private var showScore = false
	@State private var startPos:CGPoint = .zero
	@State private var isSwipping = true
	
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
				
				LessonVideoView(viewModel: viewModel, showScore: $showScore)
					.frame(height: screenSize.height/2.5)
				
				VStack {
					if showScore == false {
						LessonTextView()
					}else {
						LessonScoreView(viewModel: viewModel)
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
			}){
				NavigationGuideView(isPresented: self.$showNavigationGuide, setToView: self.$goToView)
			}
		}else{
			ContentView()
		}
	}
}

struct LessonView_Previews: PreviewProvider {
	static var previews: some View {
		LessonView().environmentObject(ScorewindData())
	}
}
