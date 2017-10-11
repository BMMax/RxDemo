//
//  Theme+Rx.swift
//  NightThemeRx
//
//  Created by user on 2017/10/9.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
///自定义 UIView 背景颜色监听者
extension Reactive where Base: UIView {

    var bgColor: Binder<Style> {
        
        return Binder(self.base) { view, style in
            switch style {
            case .dayTime:
                view.backgroundColor = ThemeStyleConfigs.DayTime.primaryBackgroundColor
                
            case .nightTime:
                view.backgroundColor = ThemeStyleConfigs.NightTime.primaryBackgroundColor
            }
        }
    }
}


/// 自定义 UILabel 文字颜色监听者
extension Reactive where Base: UILabel {
    
    var textColor: Binder<Style> {
        return Binder(self.base) { label, style in
            
            switch style {
            case .dayTime:
                label.textColor = ThemeStyleConfigs.DayTime.titleTextColor
                
            case .nightTime:
                label.textColor = ThemeStyleConfigs.NightTime.titleTextColor
            }
        }
    }
}

