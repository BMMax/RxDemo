//
//  API.swift
//  Rx+Network
//
//  Created by user on 2017/10/10.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import Gzip

enum ApiManager {
    case postHomeList([String : Any])
}

protocol ApiFormProtocol {
    var commandName: String {get}
    var parameters: [String : Any] {get}
    var parameterData: [String : Any] {get}
}

extension ApiFormProtocol {
    
    
    var parameters: [String : Any] {
        
        return [ "Token" : String.mb.random(),
                 "CommandName" : commandName,
                 "ClientVersion" : "1.0",
                 "PlatformType" : "209",
                 "TripleDesKey" : "",
                 "TripleDesIV" : "",
                 "EncryptData" : "",
                 "Data" : parameterData
        ]
    }
    var parameterData: [String : Any] { return ["":""] }
    
}

extension ApiManager: TargetType, ApiFormProtocol {
    
    var commandName: String {
        
        switch self {
        case .postHomeList:
            return "IOSBuyQueryService/GetHomePageBuyList"
        }
    }
    
    var parameterData: [String: Any] {
        
        switch self {
        case .postHomeList(let data):
            return data
        }
    }
    /// The target's base `URL`.
    var baseURL: URL {
        #if DEBUG
            let base = "http://android.zyctd.net/RequestAjax.ashx/"
            return URL(string: base)!
        #else
            return URL(string: "http://ios.zyctd.com/RequestAjax.ashx/")!
        #endif
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        return commandName
    }
    /// The HTTP method used in the request.
    var method: Moya.Method {
        
        return .post
    }
    /// Provides stub data for use in testing.
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }    
    /// The type of HTTP task to be performed.
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: JSONGzipEncoding.default)
    }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }
    
    // The headers to be used in the request.
    var headers: [String: String]? {
        return ["Content-Type" : "application/json,charset=utf-8"]
    }
}



struct JSONGzipEncoding: ParameterEncoding {
    
    //返回一个`JSONGzipEncoding`实例对象
    public static var `default`: JSONGzipEncoding { return JSONGzipEncoding() }
    
    //实现编码方法
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws
        -> URLRequest {
            var urlRequest = urlRequest.urlRequest!
            //首先进行json编码
            urlRequest = try JSONEncoding().encode(urlRequest, with: parameters)
            
            //再进行gzip压缩
            let gzippedData = try urlRequest.httpBody?.gzipped()
            urlRequest.httpBody = gzippedData
            
            if urlRequest.httpBody != nil {
                urlRequest.setValue("gzip", forHTTPHeaderField: "Content-Encoding")
            }
            return urlRequest
    }
}
let APIProvider = RxMoyaProvider<ApiManager>()

