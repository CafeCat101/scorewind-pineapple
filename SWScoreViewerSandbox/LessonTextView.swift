//
//  LessonTextView.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/8.
//

import SwiftUI

struct LessonTextView: View {
	@EnvironmentObject var scorewindData:ScorewindData
	
	var body: some View {
		HTMLStringView(htmlContent: scorewindData.currentLesson.content)
	}
}

struct LessonTextView_Previews: PreviewProvider {
	static var previews: some View {
		LessonTextView()
	}
}
