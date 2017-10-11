//
//  Base.swift
//  Rx+Network
//
//  Created by user on 2017/10/11.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation

public struct Swifty<Base> {
    /// Base object to extend.
    public let base: Base
    
    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has reactive extensions.
public protocol SwiftyCompatible {

    associatedtype CompatibleType
    static var mb: Swifty<CompatibleType>.Type { get }
    var mb: Swifty<CompatibleType> { get }
}

extension SwiftyCompatible {
    public static var mb: Swifty<Self>.Type {
        get {
            return Swifty<Self>.self
        }
    }
    
    public var mb: Swifty<Self> {
        get {
            return Swifty(self)
        }
    }
}

extension NSObject: SwiftyCompatible {}
extension String: SwiftyCompatible {}
