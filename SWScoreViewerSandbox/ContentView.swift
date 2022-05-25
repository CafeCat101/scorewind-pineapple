//
//  ContentView.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/4.
//
/*This is like a course page*/

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var scorewindData:ScorewindData
	@State private var selectedTab = "front"
	
	var body: some View {
		TabView(selection: $selectedTab) {
			Text("ScoreViewer prototype: a place to build score viewer.")
				.tabItem { Text("Front") }
				.tag("front")
			List{
				Section(header: Text("Test Courses")){
					ForEach(scorewindData.testCourses) { course in
						Button(action: {
							scorewindData.currentCourse = course
							selectedTab = "TScoreViewer"
						}) {
							Text(course.title)
								.foregroundColor(Color.black)
						}
					}
				}
				
				Section(header: Text("Test Lessons")){
					ForEach(scorewindData.testLessons) { lesson in
						Button(action: {
							scorewindData.currentLesson = lesson
							selectedTab = "TScoreViewer"
						}) {
							Text(lesson.title)
								.foregroundColor(Color.black)
						}
					}
				}
			}
				.tabItem { Text("Courses/Lessons") }
				.tag("TCourseLesson")
			if scorewindData.currentLesson.id > 0 {
				LessonView()
					.tabItem { Text("ScoreViewer") }
					.tag("TScoreViewer")
			}
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().environmentObject(ScorewindData())
	}
}
