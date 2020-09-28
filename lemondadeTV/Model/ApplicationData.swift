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
