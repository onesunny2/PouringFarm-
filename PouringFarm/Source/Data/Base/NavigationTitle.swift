//
//  NavigationTitle.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import Foundation

enum NavigationTitle {
    case 캐릭터선택화면
    case 홈화면(daejang: String)
    case 설정화면
    case 대장이름설정(name: String)
    case 푸링이변경
    
    var text: String {
        
        switch self {
        case .캐릭터선택화면: return "푸링이 선택하기"
        case let .홈화면(daejang): return "\(daejang)님의 푸링이"
        case .설정화면: return "설정"
        case let .대장이름설정(name): return "\(name)님 이름 정하기"
        case .푸링이변경: return "푸링이 변경하기"
        }
    }
}
