//
//  HeaderTableViewCell.swift
//  FlickrClone
//
//  Created by Merve Ecevit on 2/03/18.
//  Copyright © 2018 Merve Ecevit. All rights reserved.
//

import UIKit
import SnapKit

class HeaderTableViewCell: UITableViewCell {
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "profileImage")
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        label.text = "Merve Ecevit"
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "3 hours ago"
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(timeLabel)
        
        setUpProfileImageView()
        setUpNameLabel()
        setUpTimeLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpProfileImageView(){
        profileImageView.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(24)
        })
    }
    func setUpNameLabel(){
        nameLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(profileImageView.snp.right).offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.top.equalToSuperview().offset(8)
            make.right.equalTo(timeLabel.snp.left).offset(-16)
        })
    }
    func setUpTimeLabel(){
        timeLabel.snp.makeConstraints({ (make) in
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
            make.top.equalToSuperview().offset(8)
            make.width.equalTo(100)
        })
    }
    
}
