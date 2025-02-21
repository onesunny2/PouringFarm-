//
//  BaseView.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import Foundation

protocol BaseView: AnyObject {
    func configureHierarchy()
    func configureLayout()
    func configureView()
}
