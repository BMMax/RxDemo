//
//  Status.swift
//  Rx+Network
//
//  Created by user on 2017/10/10.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation
import ObjectMapper

struct Status : Mappable{
    var code : Int!
    var message : String?
    var result : Any?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        code    <-      map["code"]
        message <-      map["message"]
        result  <-      map["result"]
    }
}
