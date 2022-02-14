//
//  ScorewindTimestamp.swift
//  SWScoreViewerSandbox
//
//  Created by Leonore Yardimli on 2022/2/6.
//

import Foundation

struct Timestamp:Codable, Identifiable {
	var id = UUID()
	var measure: Int
	var timestamp: Double
}
