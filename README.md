# Flickr-Clone [![Travis CI](https://travis-ci.org/mervecevit/Flickr-Clone.svg?branch=master)](https://travis-ci.org/mervecevit/Flickr-Clone/builds) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Pull to Refresh
<img src="/flickrclone.gif" width="360px"> 

## Image with Full Screen
<img src="/flickrclone1.gif" width="360px">

## Introduction
Clone of the Flickr Application
- Name of the owner
- Photo of the owner
- Photo for the post
- Time
- Pull to refresh

## Flickr API

```swift
let url = "https://api.flickr.com/services/rest/?api_key=\(apiKey)&format=json&nojsoncallback=1"
let parameters = [
    "method": flickr.photos.getRecent,
    "extras": "owner_name, icon_server, date_upload",
    "page": "1",
    "per_page": "20"
]
```

## Requirements
- Swift 4
- Xcode 9.0+
- Alamofire
- AlamofireObjectMapper
- DateToolsSwift
- DGElasticPullToRefresh
- ObjectMapper
- SDWebImage
- SimpleImageViewer
- SnapKit
