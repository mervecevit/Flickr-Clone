//
//  Photo.swift
//  FlickrClone
//
//  Created by Merve Ecevit on 1/03/18.
//  Copyright © 2018 Merve Ecevit. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class Photo : Mappable {
    var id : String?
    var owner : String?
    var secret : String?
    var server : String?
    var farm : Int?
    var photoUrl: String?
    var ownerPhotoUrl: String?
    var imageView: UIImageView?
    var iconserver : String?
    var iconfarm : Int?
    var ownername : String?
    var dateupload: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        owner <- map["owner"]
        secret <- map["secret"]
        server <- map["server"]
        farm <- map["farm"]
        photoUrl <- map["photoUrl"]
        iconserver <- map["iconserver"]
        iconfarm <- map["iconfarm"]
        ownername <- map["ownername"]
        dateupload <- map["dateupload"]
        
        if let farm = farm, let server = server, let id = id, let secret = secret {
            getPhotoUrl(farm: farm, server: server, id: id, secret: secret)
        }
        if let iconfarm = iconfarm, let iconserver = iconserver, let owner = owner {
            getOwnerPhotoUrl(iconfarm: iconfarm, iconserver: iconserver, owner: owner)
        }
    }
    
    fileprivate func getPhotoUrl(farm: Int, server: String, id: String, secret: String) {
        photoUrl = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_c.jpg"
    }
    
    fileprivate func getOwnerPhotoUrl(iconfarm: Int, iconserver: String, owner: String){
        if Int(iconserver)! > 0 {
            ownerPhotoUrl = "https://farm\(iconfarm).staticflickr.com/\(iconserver)/buddyicons/\(owner).jpg"
        } else {
            ownerPhotoUrl = "https://www.flickr.com/images/buddyicon.gif"
        }
    }
    
}
