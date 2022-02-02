//
//  ScorewindData.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/5.
//

import Foundation
import SwiftUI

class ScorewindData: ObservableObject{
	@Published var testCourses:[Course]
	@Published var testLessons:[Lesson]
	@Published var currentCourse = Course(id:0, title: "Course Title")
	@Published var currentLesson = Lesson(id: 0, title: "Lesson Title", video: "video.mp4", scoreViewer: "score.xml", content: "")
	
	init() {
		testCourses = [
			Course(id:74781, title: "First Position Foundations (Demo)")
			,Course(id:74442,title: "First Step Towards Rhythmic Challenges")]
		testLessons = [
			Lesson(id: 50835, title: "G Major Open Parallel Thirds on First Position - Guitar Exercises", video: "https://scorewind.com/sw-music/pdfProject/Sheet12111/12111 3739 Open Parallel Thirds.mp4", scoreViewer: "https://scorewind.com/sw-music/pdfProject/Sheet12111/3739 G Major Open Parallel Thirds on First Position.xml", content: "<p>by ScoreWind Teachers</p>\n<p>The technical arpeggio p-m, i, is one of the most common styles of playing in this music genre, and together with open thirds they have made some of the most wonderful music for guitar. Pay attention to keep the legato between the notes, and a stable and rounded right hand.</p>\n \n<p>\n \n\n<p></p>"),
			Lesson(id: 50975, title: "G Major 2 Octave Scale with Slurs of 4 - Violin Exercise", video: "https://scorewind.com/sw-music/pdfProject/Sheet12179/3647 12179 G Major 2 Octave Scale With Slurs of 4.mp4", scoreViewer: "https://scorewind.com/sw-music/pdfProject/Sheet12179/3647 G Major 2 Octave Scale with Slurs of 4.xml", content: "<p>by ScoreWind Teachers</p>\n<p>Practicing this scale both with open strings and with 4th finger instead can be useful. Try to use the entire bow divided into four equal parts for learning how to use the bow economically. The finger pattern does not stay symmetrical and it is good to be aware of that.</p>\n \n<p>\n \n\n<p></p>"),
			Lesson(id: 11111, title: "Test xml layout issue", video: "https://scorewind.com/sw-music/pdfProject/Sheet12179/3647 12179 G Major 2 Octave Scale With Slurs of 4.mp4", scoreViewer: "https://scorewind.com/sw-music/music_xml_test/musescore_2247_v4.xml", content: "<p>by ScoreWind Teachers</p>\n<p>This is a test layout piece. Issue: cross head, rest sign, double bar.</p>\n \n<p>\n \n\n<p></p>")]
	}
}
