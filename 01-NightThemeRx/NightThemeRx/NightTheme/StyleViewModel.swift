//
//  StyleViewModel.swift
//  NightThemeRx
//
//  Created by user on 2017/10/9.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum Style {
    case dayTime
    case nightTime
}
struct PresentStyleViewModel {
    
    var currentStyle: Variable<Bool> = Variable<Bool>(false)
    var presentedStyle: Driver<Style>
    private let disponseBag = DisposeBag()
    
    
    init(current style: Variable<Bool>) {
        self.currentStyle = style
        
        presentedStyle = style.asDriver().flatMapLatest({ (night) -> Driver<Style> in
            if night {
                return Driver.just(.nightTime)
            } else {
                return Driver.just(.dayTime)
            }
        }) 
    }
    
    
}
