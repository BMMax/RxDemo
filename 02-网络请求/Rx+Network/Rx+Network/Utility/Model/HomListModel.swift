//
//  HomListModel.swift
//  Rx+Network
//
//  Created by user on 2017/10/11.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation
import ObjectMapper

class HomeListModel : NSObject, Mappable{
    
    var commandName : String?
    var data : HomeData?
    var encryptData : AnyObject?
    var errorCode : Int?
    var errorMessage : AnyObject?
    var tripleDesIV : AnyObject?
    var tripleDesKey : AnyObject?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return HomeListModel()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        commandName    <-   map["CommandName"]
        data           <-   map["Data"]
        encryptData    <-   map["EncryptData"]
        errorCode      <-   map["ErrorCode"]
        errorMessage   <-   map["ErrorMessage"]
        tripleDesIV    <-   map["TripleDesIV"]
        tripleDesKey   <-   map["TripleDesKey"]
        
    }
    
}


class HomeData : NSObject, Mappable{
    
    var buyList : [BuyList]?
    class func newInstance(map: Map) -> Mappable?{
        return HomeData()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        buyList <- map["BuyList"]
        
    }
}


class BuyList : NSObject, Mappable{
    
    var amount : Int?
    var billType : Int?
    var collectCount : Int?
    var createTime : String?
    var detail : String?
    var failReason : Int?
    var id : String?
    var integrity : Double?
    var inventoryPlaceAreaId : Int?
    var inventoryPlaceCityId : Int?
    var inventoryPlaceName : String?
    var inventoryPlaceProvinceId : Int?
    var isSendSamples : Int?
    var linkMan : String?
    var linkTel : String?
    var locType : String?
    var materialsId : Int?
    var materialsName : String?
    var pakageType : Int?
    var payType : Int?
    var productPlaceAreaId : Int?
    var productPlaceCityId : Int?
    var productPlaceName : String?
    var productPlaceProvinceId : Int?
    var qualityType : Int?
    var quotationSum : Int?
    var relationCount : Int?
    var standard : String?
    var state1 : Int?
    var state2 : Int?
    var unit : String?
    var updateTime : String?
    var userId : Int?
    var utilTime : String?
    var viewCount : Int?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return BuyList()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        amount <- map["Amount"]
        billType <- map["BillType"]
        collectCount <- map["CollectCount"]
        createTime <- map["CreateTime"]
        detail <- map["Detail"]
        failReason <- map["FailReason"]
        id <- map["Id"]
        integrity <- map["Integrity"]
        inventoryPlaceAreaId <- map["InventoryPlaceAreaId"]
        inventoryPlaceCityId <- map["InventoryPlaceCityId"]
        inventoryPlaceName <- map["InventoryPlaceName"]
        inventoryPlaceProvinceId <- map["InventoryPlaceProvinceId"]
        isSendSamples <- map["IsSendSamples"]
        linkMan <- map["LinkMan"]
        linkTel <- map["LinkTel"]
        locType <- map["LocType"]
        materialsId <- map["MaterialsId"]
        materialsName <- map["MaterialsName"]
        pakageType <- map["PakageType"]
        payType <- map["PayType"]
        productPlaceAreaId <- map["ProductPlaceAreaId"]
        productPlaceCityId <- map["ProductPlaceCityId"]
        productPlaceName <- map["ProductPlaceName"]
        productPlaceProvinceId <- map["ProductPlaceProvinceId"]
        qualityType <- map["QualityType"]
        quotationSum <- map["QuotationSum"]
        relationCount <- map["RelationCount"]
        standard <- map["Standard"]
        state1 <- map["State1"]
        state2 <- map["State2"]
        unit <- map["Unit"]
        updateTime <- map["UpdateTime"]
        userId <- map["UserId"]
        utilTime <- map["UtilTime"]
        viewCount <- map["ViewCount"]
        
    }
}
