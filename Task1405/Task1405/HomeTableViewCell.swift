//
//  HomeTableViewCell.swift
//  Task1405
//
//  Created by Balaji U on 14/05/21.
//  Copyright © 2021 Balaji U. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageOutlet: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    
    func setCellWithValuesOf(_ Book: BookData) {
        updateUI(title: Book.Title, author: Book.Author, cover: Book.Cover)
    }
    
    
    private func updateUI(title: String?, author: String?, cover: String?) {
           
    self.titleLabel.text = title
            
    self.authorLabel.text = author
    
        let image = UIImage(named: cover!)
    self.coverImageOutlet.image = image
    
    
            
        }
        

}
