//
//  PouringSet.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/20/25.
//

import Foundation

enum PouringName: String, CaseIterable {
    case 따끔푸링 = "따끔따끔 푸링이"
    case 헤실푸링 = "헤실헤실 푸링이"
    case 반짝푸링 = "반짝반짝 푸링이"
    case 준비중 = "준비중이에요"

    // 푸링이 자기소개
    var introduction: String {
        
        switch self {
        default: return pouringIntro[self] ?? self.rawValue
        }
    }
    
    static func pouringsList(total: Int) -> [PouringInfo] {

        let pourings = PouringName.allCases + Array(repeating: PouringName.준비중, count: (total - 4))
        let list = pourings.map {
            PouringInfo(
                type: $0,
                name: $0.rawValue,
                image: $0.imageName(10)
            )
        }
        
        return list
    }
    
    // 현재 레벨에 따른 이미지명
    func imageName(_ level: Int = 1) -> String {
        switch self {
        case .따끔푸링: return "1-\(level)"
        case .헤실푸링: return "2-\(level)"
        case .반짝푸링: return "3-\(level)"
        case .준비중: return "noImage"
        }
    }
}

private let pouringIntro: [PouringName: String] = [
    PouringName.따끔푸링: "안녕하세요! 저는 따끔따끔 푸링이에요:>\n저는 뾰족뾰족 가시로 저를 괴롭히는 못된 슬라임들을 따끔하게 혼내줍니다!\n앗! 그래도 절 키워주신다면 지켜드릴게요S2",
    PouringName.헤실푸링: "헤헤헤헤헤%^^%\n이름에서부터 보이겠지만 저는 실없이 잘 웃는 헤실헤실 푸링이에요 헤헤..\n재미없는 농담을 하셔도 제가 항상 웃어드릴 수 있답니다 헤헤=_=",
    PouringName.반짝푸링: "나는야 꾸미기를 좋아하는 스타 슬라임~ 반짝반짝 푸링이야!\n주인공이 되고 싶다면 나와 함께해!\n내가 반짝반짝 후광을 비춰줄게!!",
    PouringName.준비중: "새로운 푸링이가 준비중입니다!\n빠른 시일내로 찾아올테니 다른 푸링이를 선택해주세요!"
]

//private let pouringComment: [String] = [
//    String(format: <#T##String#>, SavingInfo.daejang)
//]
