//
//  ApiManager.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//

import Foundation


class APIService {
    static let shared = APIService()
    
    struct Constants {
        static let baseDessertsURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        static let dessertDetailsURL = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    }
    
    private init() {}
    
    enum APIError: Error {
        case invalidURL
        case noData
        case decodingError(Error)
        case networkError(Error)
    }
    
   
 
    func fetchData<T: Decodable>(from urlString: String,
                                 completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for a network error.
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            // Ensure data is received.
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                // Decode the data into the expected type.
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch let decodeError {
                completion(.failure(.decodingError(decodeError)))
            }
        }.resume()
    }
}
