//
//  SymbolImage.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/23/25.
//

import UIKit

enum SymbolImage {
    case 프로필
    case 밥
    case 물
    case 이름설정
    case 푸링이변경
    case 초기화
    
    var img: UIImage {
        switch self {
        case .프로필: return UIImage(systemName: "person.crop.circle") ?? UIImage()
        case .밥: return UIImage(systemName: "leaf.circle") ?? UIImage()
        case .물: return UIImage(systemName: "drop.circle") ?? UIImage()
        case .이름설정: return UIImage(systemName: "pencil") ?? UIImage()
        case .푸링이변경: return UIImage(systemName: "moon.fill") ?? UIImage()
        case .초기화: return UIImage(systemName: "arrow.clockwise") ?? UIImage()
        }
    }
}
