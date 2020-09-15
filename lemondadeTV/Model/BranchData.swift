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

let BrandMockData = """
[{
    "GuidelinesShort": "",
    "GuidelinesLong": "",
    "ProductCount": 42,
    "CommissionRange": "20%-30%",
    "ApplicationStatusCode": "",
    "SellerCount": 17,
    "FriendlySellerCount": "0",
    "GuidId": "00000000-0000-0000-0000-000000000000",
    "Id": 3,
    "Name": "Craft&Commerce",
    "Email": "hethe@craftandcommerceusa.com",
    "PictureUrl": "https://mdlprodphotostorage.blob.core.windows.net/ecommerce/0000028_Craft Commerce Logo-01.",
    "Description": "Craft & Commerce is a brand and destination for the modern woman and man, with thoughtfully designed and curated fashion, beauty, and home goods. Our mission is to empower our community with refined style that's truly accessible."
}, {
    "GuidelinesShort": "",
    "GuidelinesLong": "",
    "ProductCount": 21,
    "CommissionRange": "20%",
    "ApplicationStatusCode": "",
    "SellerCount": 14,
    "FriendlySellerCount": "0",
    "GuidId": "00000000-0000-0000-0000-000000000000",
    "Id": 6,
    "Name": "2250 Watts",
    "Email": "2250watts@gmail.com",
    "PictureUrl": "https://mdlprodphotostorage.blob.core.windows.net/ecommerce/0000086_WATTS-01",
    "Description": "2250 The Brand Watts California"
}, {
    "GuidelinesShort": "",
    "GuidelinesLong": "",
    "ProductCount": 17,
    "CommissionRange": "18%",
    "ApplicationStatusCode": "Approved",
    "SellerCount": 16,
    "FriendlySellerCount": "0",
    "GuidId": "00000000-0000-0000-0000-000000000000",
    "Id": 60,
    "Name": "Zaks Food Storage",
    "Email": "Zak@test.com",
    "PictureUrl": "https://mdlprodphotostorage.blob.core.windows.net/ecommerce/0000906_IMG_1836",
    "Description": "Best Food around"
}, {
    "GuidelinesShort": "",
    "GuidelinesLong": "",
    "ProductCount": 30,
    "CommissionRange": "32%",
    "ApplicationStatusCode": "Pending",
    "SellerCount": 10,
    "FriendlySellerCount": "0",
    "GuidId": "00000000-0000-0000-0000-000000000000",
    "Id": 6,
    "Name": "2250 Watts",
    "Email": "2250watts@gmail.com",
    "PictureUrl": "https://mdlprodphotostorage.blob.core.windows.net/ecommerce/0002645__DSC3009",
    "Description": "This is a cool company"
}, {
    "GuidelinesShort": "",
    "GuidelinesLong": "",
    "ProductCount": 50,
    "CommissionRange": "15%",
    "ApplicationStatusCode": "",
    "SellerCount": 35,
    "FriendlySellerCount": "0",
    "GuidId": "00000000-0000-0000-0000-000000000000",
    "Id": 65,
    "Name": "Jay Pro Shop",
    "Email": "Jay@test.com",
    "PictureUrl": "https://mdlprodphotostorage.blob.core.windows.net/ecommerce/0000548_Orange and Tangerines",
    "Description": "For the pros"
}, {
    "GuidelinesShort": "",
    "GuidelinesLong": "",
    "ProductCount": 76,
    "CommissionRange": "32%",
    "ApplicationStatusCode": "Denied",
    "SellerCount": 14,
    "FriendlySellerCount": "0",
    "GuidId": "00000000-0000-0000-0000-000000000000",
    "Id": 6,
    "Name": "Zippy's Clothing",
    "Email": "Zippy@test.com",
    "PictureUrl": "https://mdlprodphotostorage.blob.core.windows.net/ecommerce/0001198_E54FB2DB-CD87-4F7A-ADB0-04A37EB911C0",
    "Description": "Awesome clothing!"
}]
""".data(using: .utf8)!
