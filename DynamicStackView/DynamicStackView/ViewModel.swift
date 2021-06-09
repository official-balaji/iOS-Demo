//
//  ViewModel.swift
//  DynamicStackView
//
//  Created by Balaji U on 07/06/21.
//  Copyright © 2021 Balaji U. All rights reserved.
//

import Foundation
import UIKit

class ViewModel {
    
    var data = [DataSource]()
    
    func parse() {
        guard let path = Bundle.main.path(forResource: "DataSource", ofType: "json") else
        {
            return
        }
        let url = URL(fileURLWithPath: path)
        do{
            let jsonData = try Data(contentsOf: url)
            if let dataDictionaries = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [[String:Any]] {
            let result = dataDictionaries.compactMap(DataSource.init)
            data = result
                //print(result)
            }
            
        }
        catch{
            print("Json data Source error: \(error)")
        }

    }

    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func getImageDataFrom(url: String) -> UIImage {
        
        let url = URL(string: url)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        guard let image = UIImage(data: data!) else
        {
            return UIImage(named: "1.png")!
        }
        return image
    }
    
}
