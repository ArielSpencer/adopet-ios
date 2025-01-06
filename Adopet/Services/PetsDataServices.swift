//
//  PetsDataServices.swift
//  Adopet
//
//  Created by Ariel Spencer on 02/01/25.
//

import Foundation

class PetsDataServices {
    
    private var networkingService: NetworkingProtocol = URLSessionNetworking()
    
    func fatchPets(completion: @escaping (Result<[Pet], NetworkingError>) -> Void) {
        
        guard let url = URL(string: "https://my-json-server.typicode.com/giovannamoeller/pets-api/pets") else { return }
        
        networkingService.request(url, completion: completion)
    }
}
