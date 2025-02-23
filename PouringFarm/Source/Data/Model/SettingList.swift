//
//  SettingList.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/24/25.
//

import UIKit

struct SettingList {
    let image: UIImage
    let title: String
    let detail: String
}

let settings = [
    SettingList(image: SymbolImage.이름설정.img, title: "내 이름 설정하기", detail: SavingInfo.daejang),
    SettingList(image: SymbolImage.푸링이변경.img, title: "푸링이 변경하기", detail: ""),
    SettingList(image: SymbolImage.초기화.img, title: "데이터 초기화", detail: "")
]
