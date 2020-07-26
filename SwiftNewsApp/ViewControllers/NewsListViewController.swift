//
//  NewsListViewController.swift
//  SwiftNewsApp
//
//  Created by Ayushi on 2020-07-25.
//  Copyright © 2020 Ayushi. All rights reserved.
//

import UIKit
@_exported import SDWebImage
import SwiftyJSON

class NewsListViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - IBOutlets
    
    var arrSwiftNews : [NewsDataModel] = []
    
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getSwiftNewsData()
        
    }
    
    // MARK: - Helper Methods
    
    private func getSwiftNewsData() {

        ApiClass.shared.apiSwiftNews{ [unowned self] (arrNewsData) in
            
            DispatchQueue.main.async {
                self.arrSwiftNews = arrNewsData
                self.tableView.reloadData()

            }
        }
        
    }
    
    // MARK: - IBActions
    
    
}

// MARK: - UIPageViewControllerDataSource, UIPageViewControllerDelegate

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    // tell the collection view how many cells to make
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrSwiftNews.count
    }
    
    // make a cell for each cell index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewsIdentifiers.kNewsTableViewCell) as! NewsTableViewCell
        
        cell.photo.layer.cornerRadius = 10
        
        cell.lblName.text = self.arrSwiftNews[indexPath.row].title
        
        if let imgURL = self.arrSwiftNews[indexPath.row].thumbnail {
            if imgURL.isValidURL {
                cell.photoContentView.isHidden = false
                cell.photo.isHidden = false
                cell.photo.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "placeholder.jpg"))
            } else {
                cell.photoContentView.isHidden = true
                cell.photo.isHidden = true
            }
        }

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StoryBoard.instantiateViewController(identifier: "NewsDetailsViewController") as! NewsDetailsViewController
        vc.newsDetails = self.arrSwiftNews[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
