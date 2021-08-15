//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
import Kingfisher

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var bodyContainerView: UIView!
    @IBOutlet weak var body: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        bodyContainerView.layer.cornerRadius = 8
        bodyContainerView.layer.borderWidth = 0.1
        userImage.makeRounded()
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        let url = URL(string: message.avatar_url)
        userImage.kf.setImage(with: url)
        header.text = message.name
        body.text = message.message
    }
    

}
