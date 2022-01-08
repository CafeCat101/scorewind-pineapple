//
//  ContentView.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/1/4.
//
/*This is like a course page*/

import SwiftUI

struct ContentView: View {
  @State private var showNavigationGuide = false
  @State private var goToView = "course"
  var body: some View {
    if goToView == "course" {
      VStack{
        Button("ScoreViewer prototype") {
          showNavigationGuide = true
        }
      }
      .sheet(isPresented: $showNavigationGuide){
        NavigationGuideView(isPresented: self.$showNavigationGuide, setToView: self.$goToView)
      }
    }else{
      LessonView()
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
