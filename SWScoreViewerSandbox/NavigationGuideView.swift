//
//  NavigationGuideView.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/5.
//

import SwiftUI

struct NavigationGuideView: View {
  @Binding var isPresented:Bool
  @Binding var setToView:String
	@EnvironmentObject var scorewindData:ScorewindData
  
  var body: some View {
    VStack{
      List{
        Section(header: Text("Test Courses")){
					ForEach(scorewindData.testCourses) { course in
						Button(action: {
							scorewindData.currentCourse = course
							self.isPresented = false
							self.setToView = "course"
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
							self.isPresented = false
							self.setToView = "lesson"
						}) {
							Text(lesson.title)
								.foregroundColor(Color.black)
						}
					}
        }
      }
    }
  }
}

struct NavigationGuideView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationGuideView(isPresented: .constant(false), setToView: .constant(""))
			.environmentObject(ScorewindData())
  }
}
