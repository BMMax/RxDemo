//
//  ViewModelType.swift
//  MVVM
//
//  Created by user on 2017/10/12.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}


protocol OptimizeViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
    
}
