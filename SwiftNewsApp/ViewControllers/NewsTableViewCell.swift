//
//  NewsTableViewCell          @IBOutlet weak var lblName: UILabel!     @IBOutlet weak var photoContentView: UIView!     @IBOutlet weak var photo: UIImageView!          override func awakeFromNib() {         super.swift
//  SwiftNewsApp
//
//  Created by Ayushi on 2020-07-26.
//  Copyright © 2020 Ayushi. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var photoContentView: UIView!
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
