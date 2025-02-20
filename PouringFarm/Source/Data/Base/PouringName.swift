//
//  PouringSet.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/20/25.
//

import Foundation

enum PouringName: String {
    case 따끔푸링 = "따끔따끔 푸링이"
    case 방실푸링 = "방실방실 푸링이"
    case 반짝푸링 = "반짝반짝 푸링이"
    
    var introduction: String {
        
        switch self {
        case .따끔푸링: return pouringIntro[0]
        case .방실푸링: return pouringIntro[1]
        case .반짝푸링: return pouringIntro[2]
        }
    }
    
    // 현재 레벨에 따른 이미지명
    func imageName(_ level: Int) -> String {
        switch self {
        case .따끔푸링: return "1-\(level)"
        case .방실푸링: return "2-\(level)"
        case .반짝푸링: return "3-\(level)"
        }
    }
}

private let pouringIntro: [String] = [
    "",
    "",
    ""
]
