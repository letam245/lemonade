//
//  BranchData.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import Foundation
struct Brand: Decodable {
    var GuidelinesShort : String?
    var GuidelinesLong:  String?
    var ProductCount: Int
    var CommissionRange: String?
    var ApplicationStatusCode:  String?
    var SellerCount:  Int
    var FriendlySellerCount:  String
    var GuidId: String
    var Id : Int
    var Name : String
    var Email : String
    var PictureUrl : String
    var Description : String
}
