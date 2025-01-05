//
//  PetsDataServices.swift
//  Adopet
//
//  Created by Ariel Spencer on 02/01/25.
//

import Foundation

class PetsDataServices {
    func fatchPets(url: URL, completion: @escaping (Result<[Pet], NetworkingError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (responseData, _, error) in
            if let error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = responseData else {
                completion(.failure(.dataUnavailable))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([Pet].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}
