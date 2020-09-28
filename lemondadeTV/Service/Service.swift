//
//  Service.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/27/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import Foundation
class Service {
    static let shared = Service()
    
    func fetchBrands(completion: @escaping ([Brand]?, Error?) -> Void) {
        let source = "BrandData"
        fetchGeneticJSONData(source: source, completion: completion)
    }
    
    func fetchProducts(completion: @escaping ([Product]?, Error?) -> Void) {
      let source = "ProductData"
      fetchGeneticJSONData(source: source, completion: completion)
    }
    
    
    func fetchGeneticJSONData<T: Decodable>(source: String, completion: @escaping (T?, Error?) -> ())  {
        guard let path = Bundle.main.path(forResource: source, ofType: "json") else { return }
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let brands = try JSONDecoder().decode(T.self, from: data)
                completion(brands, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}

class Stack<T: Decodable> {
    var items = [T]()
}
