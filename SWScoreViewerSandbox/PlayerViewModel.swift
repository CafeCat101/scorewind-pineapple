//
//  PlayerViewModel.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/2/4.
//

import Foundation
import AVKit

class PlayerViewModel: ObservableObject {
	let player: AVPlayer
	
	init(videoURL:String){
		player = AVPlayer(url: URL(string: videoURL)!)
	}
}
