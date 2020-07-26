//
//  NewsDetailsViewController.swift
//  SwiftNewsApp
//
//  Created by Ayushi on 2020-07-25.
//  Copyright © 2020 Ayushi. All rights reserved.
//

import UIKit

class NewsDetailsViewController:  UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var newsPhoto: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDetailsLabel: UILabel!
    
    // MARK: - IBOutlets
    
    var newsDetails = NewsDataModel()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    // MARK: - Helper Methods
    
    private func setup() {
        self.newsPhoto.layer.cornerRadius = 10
        
        self.newsTitleLabel.text = self.newsDetails.title
        self.newsDetailsLabel.text = self.newsDetails.selftext
        
        if let imgURL = self.newsDetails.thumbnail {
            if imgURL.isValidURL {
                self.newsPhoto.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "placeholder.jpg"))
            } else {
                self.newsPhoto.isHidden = true
            }
        }
    }
    
    // MARK: - IBActions
    
    
}

