//
//  HomeViewModel.swift
//  Task1405
//
//  Created by Balaji U on 14/05/21.
//  Copyright © 2021 Balaji U. All rights reserved.
//

import UIKit

class HomeViewModel {
    var Books = [BookData]()
    
//    var Books = [
//        BookData(Title: "Higher Education", Author: "John", Cover: "1"),
//        BookData(Title: "The King of Drug", Author: "Peter Walker", Cover: "2"),
//        BookData(Title: "My Book Cover", Author: "Harper lee", Cover: "3"),
//        BookData(Title: "Heart String Mountain", Author: "J K Row", Cover: "4"),
//        BookData(Title: "Memory", Author: "James Martine", Cover: "5"),
//        BookData(Title: "Water & Flame", Author: "Snoop Dag", Cover: "6"),
//        BookData(Title: "Beautiful world W r u", Author: "Shawn Mendez", Cover: "7"),
//        BookData(Title: "Power of Light", Author: "James Corden", Cover: "8"),
//        BookData(Title: "BOSTON", Author: "Jimmy Felon", Cover: "9"),
//    ]
    
    
    func parse() {
       // print("inside---")
        guard let path = Bundle.main.path(forResource: "BookData", ofType: "json") else
        {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        var result = [BookData]()
        
        do{
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode([BookData].self, from: jsonData)
            Books = result
            
        }
        catch{
            print("Json data Source error: \(error)")
        }

    }
    
    
    
    
    func numberOfRowsInSection(section: Int) -> Int {
        if Books.count != 0 {
            return Books.count
            }
            return 0
        }
        
        func cellreturntest (indexPath: IndexPath) -> BookData {
            let data = Books[indexPath.row]
            return data
          
        }
        
}
