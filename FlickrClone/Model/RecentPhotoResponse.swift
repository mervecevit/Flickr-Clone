//
//  RecentResponse.swift
//  FlickrClone
//
//  Created by Merve Ecevit on 1/03/18.
//  Copyright © 2018 Merve Ecevit. All rights reserved.
//

import ObjectMapper

class RecentPhotoResponse : Mappable {
    var photos : Photos?
    var stat : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        photos <- map["photos"]
        stat <- map["stat"]
    }
}
