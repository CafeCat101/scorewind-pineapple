//
//  PlayerViewModel.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/2/4.
//

import Foundation
import AVKit

class PlayerViewModel {
	var player:AVPlayer?
	
	func setPlayer(videoURL:String){
		player = AVPlayer(url: URL(string: decodeVideoURL(videoURL: videoURL))!)
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


