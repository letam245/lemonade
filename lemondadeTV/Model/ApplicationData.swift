//
//  ApciationData.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import Foundation

struct ApplicationData: Decodable {
    var userId : Int
    var applicationDescription:  String?
    var dateSubmitted: String?
}

//let ApplicationMockData = """
//{
//"userId": 142
//"applicationDescription": "Hello I would like to apply to sell your products."
//"dateSubmitted": "2016-02-29 12:24:26"
//}
//""".data(using: .utf8)!
