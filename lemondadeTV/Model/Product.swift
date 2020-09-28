//
//  ProductData.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import Foundation
struct Product: Decodable {
    var picture: Picture?
    var price: Double
    var name : String
    var id: Int
}

struct Picture: Decodable {
    var id: Int
    var url: String?
    var thumbUrl:  String?
    var filePath: String?
    var mimeType: String?
    var seoFilename: String
    var altAttribute: String
    var titleAttribute: String
    var isNew: Bool
    var binaryData: Data?
}
