//
//  PhotoTableViewCell.swift
//  FlickrClone
//
//  Created by Merve Ecevit on 2/03/18.
//  Copyright © 2018 Merve Ecevit. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        addSubview(postImageView)
        
        setUpPostImageView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpPostImageView(){
        postImageView.snp.makeConstraints({ (make) in
        make.left.equalToSuperview()
        make.top.equalToSuperview()
        make.bottom.equalToSuperview()
        make.right.equalToSuperview()
        })
    }
    
}
