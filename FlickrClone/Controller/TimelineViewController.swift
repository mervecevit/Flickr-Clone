//
//  TimelineViewController.swift
//  FlickrClone
//
//  Created by Merve Ecevit on 1/03/18.
//  Copyright © 2018 Merve Ecevit. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire
import AlamofireObjectMapper
import DGElasticPullToRefresh
import SimpleImageViewer
import DateToolsSwift

class TimelineViewController: UITableViewController {
    
    var photos: [Photo]?
    let photoCellId = "photoCellId"
    let headerCellId = "headerCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "Flickr"
        
        fetchPhotos()
        setUpNavigationController()
        setUpTableView()
    }
    
    fileprivate func fetchPhotos(){
        let url = "\(baseUrl)?api_key=\(apiKey)&format=json&nojsoncallback=1"
        let parameters = [
            "method": flickrGetRecentMethod,
            "extras": "owner_name, icon_server, date_upload",
            "page": "1",
            "per_page": "20"
        ]
        Alamofire.request(url, parameters: parameters).responseObject { (response: DataResponse<RecentPhotoResponse>) in
            let recentPhotoResponse = response.result.value
            self.photos = recentPhotoResponse?.photos?.photo
            if self.photos != nil {
                self.tableView.reloadData()
            }
        }
    }
    
    fileprivate func setUpNavigationController(){
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor(red: 20/255.0, green: 20/255.0, blue: 20/255.0, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    fileprivate func setUpTableView(){
        self.tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: headerCellId)
        self.tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: photoCellId)
        self.tableView.separatorColor = UIColor.white
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor(red: 16/255.0, green: 80/255.0, blue: 216/255.0, alpha: 1.0)
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            self?.fetchPhotos()
            self?.tableView.dg_stopLoading()
            }, loadingView: loadingView)
        
        tableView.dg_setPullToRefreshFillColor(UIColor(red: 20/255.0, green: 20/255.0, blue: 20/255.0, alpha: 1.0))
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
    }
    
    deinit {
        tableView.dg_removePullToRefresh()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let configuration = ImageViewerConfiguration { config in
                config.imageView = photos?[indexPath.section].imageView
            }
            let imageViewerController = ImageViewerController(configuration: configuration)
            present(imageViewerController, animated: true)
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return photos?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let photo: Photo = photos?[indexPath.section] else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headerCellId, for: indexPath) as! HeaderTableViewCell
            cell.selectionStyle = .none
            cell.nameLabel.text = photo.ownername
            cell.profileImageView.sd_setImage(with: URL(string: photo.ownerPhotoUrl!), placeholderImage: UIImage(named: "profileImage"))
            let uploadDate: Date = Date(timeIntervalSince1970: Double(photo.dateupload!)!)
            cell.timeLabel.text = uploadDate.timeAgoSinceNow
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: photoCellId, for: indexPath) as! PhotoTableViewCell
        cell.postImageView.sd_setImage(with: URL(string: photo.photoUrl!), placeholderImage: UIImage(named: "placeholder"))
        photo.imageView = cell.postImageView
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return self.view.frame.width
        }
        return 60
    }
}
