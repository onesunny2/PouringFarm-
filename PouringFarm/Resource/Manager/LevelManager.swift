//
//  LevelManager.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/23/25.
//

import Foundation

final class LevelManager {
    
    static let shared = LevelManager()
    private init() {}
    
    var invalidBabCount = false
    var invalidWaterCount = false
    
    // 밥알 갯수 카운트
    func getBabCount(_ bab: String) {
        
        guard !bab.isEmpty else {
            SavingInfo.currentBab += 1
            return
        }
        
        guard let babCount = Int(bab), babCount <= 99 else {
            invalidBabCount = true
            return
        }
        
        SavingInfo.currentBab += babCount
        
    }
    
    // 물 갯수 카운트
    func getWaterCount(_ water: String) {
        
        guard !water.isEmpty else {
            SavingInfo.currentWater += 1
            return
        }
        
        guard let waterCount = Int(water), waterCount <= 49 else {
            invalidWaterCount = true
            return
        }
        
        SavingInfo.currentWater += waterCount
    }
    
    // 레벨 카운트
    func caculateLevel() {
        
        let result = Int((Double(SavingInfo.currentBab) / 5) + (Double(SavingInfo.currentWater) / 2)) / 10
        
        switch result {
        case 0...1: SavingInfo.currentLevel = 1
        case 10...: SavingInfo.currentLevel = 10
        default: SavingInfo.currentLevel = result
        }
    }
}
