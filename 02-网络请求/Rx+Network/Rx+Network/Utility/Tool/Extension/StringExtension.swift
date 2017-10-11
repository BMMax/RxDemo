//
//  StringExtension.swift
//  Rx+Network
//
//  Created by user on 2017/10/11.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation
extension Swifty where Base == String {

    public static func random(of length: Int = 32) -> String {

        guard length > 0 else { return ""}
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomIndex = arc4random_uniform(UInt32(base.characters.count))
        let randomCharacter = "\(base[base.index(base.startIndex, offsetBy: String.IndexDistance(randomIndex))])"
        return (0..<length).reduce("") { return $0.0 + randomCharacter }
    }
}


