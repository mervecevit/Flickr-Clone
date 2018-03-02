//
//  Photos.swift
//  FlickrClone
//
//  Created by Merve Ecevit on 1/03/18.
//  Copyright © 2018 Merve Ecevit. All rights reserved.
//

import ObjectMapper

class Photos :  Mappable{
    var photo : [Photo]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        photo <- map["photo"]
    }
}

