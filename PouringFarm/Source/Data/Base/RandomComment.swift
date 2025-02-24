//
//  RandomComment.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/24/25.
//

import Foundation

enum RandomComment: CaseIterable {
    case 미소간직
    case 노을속
    case 밤하늘
    case 찬바람
    
    static func set(_ name: String) -> String {
        
        let selected = RandomComment.allCases.randomElement()!
        
        switch selected {
        case .미소간직: return "저 달빛에 그려지는 \(name)님의 미소를 간직해"
        case .노을속: return "그을진 저 노을 속에 \(name)님 얼굴이 떠올라"
        case .밤하늘: return "\(name)님은 밤하늘에 놓인 작은 별 같아요 매일 밤마다 나를 찾아와"
        case .찬바람: return "또 찬바람이 불어와 \(name)님의 맘을 뒤흔들면 포근한 저 바람 되어 안아줄게요"
        }
    }
}
