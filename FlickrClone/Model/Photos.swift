//
//  Photos.swift
//  FlickrClone
//
//  Created by Merve Ecevit on 1/03/18.
//  Copyright © 2018 Merve Ecevit. All rights reserved.
//

import ObjectMapper

class Photos :  Mappable{
    var page : Int?
    var pages : Int?
    var perpage : Int?
    var total : Int?
    var photo : [Photo]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        page <- map["page"]
        pages <- map["pages"]
        perpage <- map["perpage"]
        total <- map["total"]
        photo <- map["photo"]
    }
}

