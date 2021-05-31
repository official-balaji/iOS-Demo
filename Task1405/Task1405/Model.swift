//
//  Model.swift
//  Task1405
//
//  Created by Balaji U on 14/05/21.
//  Copyright © 2021 Balaji U. All rights reserved.
//

import Foundation


struct BookData : Codable
{
    let Title: String
    let Author: String
    let Cover: String
    
}

struct Book : Codable
{
    let data:[BookData]
}
