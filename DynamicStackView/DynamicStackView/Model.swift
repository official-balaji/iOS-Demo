//
//  Model.swift
//  DynamicStackView
//
//  Created by Balaji U on 07/06/21.
//  Copyright © 2021 Balaji U. All rights reserved.
//

import Foundation

struct DataSource {
    
    var type :String
    var backgroundColor :String
    var fontSize :String
    var textColor :String
    var source :String
    var width :Int
    var Height :Int
    var sourceImg :String
   
   
    
}

struct Index{
    var index: Int
}


extension DataSource {
    
    init?(dictionary :[String:Any]) {
        
        
        if let type = dictionary["type"] as? String {
             self.type = type
                 }
        else {
            self.type = "NA"
        }
        
        if let backgroundColor = dictionary["backgroundColor"] as? String {
             self.backgroundColor = backgroundColor
                 }
        else {
            self.backgroundColor = "NA"
        }
        
        if let fontSize = dictionary["fontSize"] as? String {
            self.fontSize = fontSize
                 }
        else {
            self.fontSize = "NA"
        }
        
        if let textColor = dictionary["textColor"] as? String {
             self.textColor = textColor
                 }
        else {
            self.textColor = "NA"
        }
        
        if let source = dictionary["source"] as? String {
             self.source = source
                 }
        else {
            self.source = "NA"
        }
        
        if let width = dictionary["width"] as? Int {
             self.width = width
                 }
        else {
            self.width = 0
        }
        
        if let Height = dictionary["Height"] as? Int {
             self.Height = Height
                 }
        else {
            self.Height = 0
        }
        
        if let sourceImg = dictionary["sourceImg"] as? String {
             self.sourceImg = sourceImg
                 }
        else {
            self.sourceImg = "NA"
        }
        
    }
    
}



