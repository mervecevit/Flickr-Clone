//
//  TimelineViewController.swift
//  FlickrClone
//
//  Created by Merve Ecevit on 1/03/18.
//  Copyright © 2018 Merve Ecevit. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class TimelineViewController: UITableViewController {
    
    var photos: [Photo]?
    let photoCellId = "photoCellId"
    let headerCellId = "headerCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "Flickr"
        self.tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: headerCellId)
        self.tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: photoCellId)
        
        fetchPhotos()
    }
    
    fileprivate func fetchPhotos(){
        let url = "\(baseUrl)\(flickrMethod)&api_key=\(apiKey)&per_page=20&page=1&format=json&nojsoncallback=1"
        Alamofire.request(url).responseObject { (response: DataResponse<RecentPhotoResponse>) in
            
            let recentPhotoResponse = response.result.value
            self.photos = recentPhotoResponse?.photos?.photo
            if self.photos != nil {
                self.tableView.reloadData()
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return photos?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headerCellId, for: indexPath) as! HeaderTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: photoCellId, for: indexPath) as! PhotoTableViewCell
        cell.backgroundColor = .blue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return self.view.frame.width
        }
        return 40
    }
}

