//
//  GenericRequest.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

protocol GenericRequestProtocol {
    var error: Error { get set }
}

class GenericRequest: GenericRequestProtocol {
    
    var error = NSError(domain: "", code: 901, userInfo: [NSLocalizedDescriptionKey: "Error getting information"]) as Error
    
    func request<T: Codable>(urlRequest: URLRequest, completion: @escaping completion<T?>) {
        print(urlRequest)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                completion(nil, self.error)
                return
            }
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(object, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
