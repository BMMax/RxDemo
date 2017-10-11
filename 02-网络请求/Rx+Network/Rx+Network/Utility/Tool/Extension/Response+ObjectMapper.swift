//
//  Response+ObjectMapper.swift
//  Rx+Network
//
//  Created by user on 2017/10/10.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import RxSwift

enum MBError: Swift.Error {
    case networkResultError(Status)
}

extension Response  {
    public func mapResult<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> [T] {
        
        let status = try mapObject(Status.self)
        guard let array = status.result as? [[String: Any]] else {
              throw MBError.networkResultError(status)
        }
        let objects = Mapper<T>(context: context).mapArray(JSONArray: array)
        return objects
    }
}

//=======================================================
// MARK: Json -> Model
//=======================================================
extension Response  {

    /// Maps data received from the signal into an object which implements the Mappable protocol.
    /// If the conversion fails, the signal errors.
    public func mapObject<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> T {
        guard let object = Mapper<T>(context: context).map(JSONObject: try mapGzipJson()) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
    
    /// Maps data received from the signal into an array of objects which implement the Mappable
    /// protocol.
    /// If the conversion fails, the signal errors.
    public func mapArray<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> [T] {
        guard let array = try mapGzipJson() as? [[String : Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return Mapper<T>(context: context).mapArray(JSONArray: array)
    }
    
}

//=======================================================
// MARK: Gzip解压
//=======================================================
extension Response  {

    func mapGzipJson() throws-> Any {
        

        if data.isGzipped {
            
            do {
                return try JSONSerialization.jsonObject(with: data.gunzipped(), options: .allowFragments)
            } catch {
                if data.count < 1 {
                    return NSNull()
                }
                throw MoyaError.jsonMapping(self)
            }
        } else {
            return try mapJSON()
        }
    }
}
 //MARK: - 将Json转换成流
extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    
    public func mapModel<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) -> Single<T> {
        return flatMap { response -> Single<T> in
            return Single.just(try response.mapObject(type, context: context))
        }
    }
}
