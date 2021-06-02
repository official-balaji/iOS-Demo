//
//  CollectionViewCell.swift
//  Task1405
//
//  Created by Balaji U on 01/06/21.
//  Copyright © 2021 Balaji U. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
 
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var bookTitleCell: UILabel!
    
    func setCellWithValuesOf(_ Book: BookData) {
        updateUI(title: Book.Title, cover: Book.Cover)
    }
    
    
    private func updateUI(title: String?, cover: String?) {
           
        self.bookTitleCell.text = title
    
        let image = UIImage(named: cover!)
        self.imageCell.image = image
            
        }
    
    
}
