//
//  BaseViewModel.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import Foundation
import RxSwift

protocol BaseViewModel: AnyObject {
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get set }
    
    func transform(input: Input) -> Output
}
