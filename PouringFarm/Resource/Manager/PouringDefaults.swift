//
//  UserDefaultsManager.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/20/25.
//

import Foundation

@propertyWrapper
struct PouringDefaults<T> {
    
    let key: String
    let empty: T
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? empty
        }
        set {
            UserDefaults.standard.set(newValue as T, forKey: key)
        }
    }
}

// 외부에서 호출해서 사용 할 푸링디폴트의 key 값들
enum SavingInfo: String {
    case 대장이름 = "daejang"
    case 푸링이종류 = "pouring"
    case 현재_푸링이_레벨 = "pouringLevel"
    case 현재_푸링이_밥갯수 = "pouringBab"
    case 현재_푸링이_물갯수 = "pouringWater"
    case 최초_푸링이_선택유무 = "isSelectedPouringFirst"
}
