//
//  PetsDataServices.swift
//  Adopet
//
//  Created by Ariel Spencer on 02/01/25.
//

import Foundation

protocol PetsDataServicesDelegate: AnyObject {
    func didFetchPetsSuccessfully(_ pets: [Pet])
    func didFailWithError(_ error: NetworkingError)
}

class PetsDataServices {
    
    weak var delegate: PetsDataServicesDelegate?
    
    private var networkingService: NetworkingProtocol = URLSessionNetworking()
    
    func fatchPets() {
        
        guard let url = URL(string: "https://my-json-server.typicode.com/giovannamoeller/pets-api/pets") else { return }
        
        networkingService.request(url) { [weak self] (result: Result<[Pet], NetworkingError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let pets):
                    self?.delegate?.didFetchPetsSuccessfully(pets)
                case .failure(let failure):
                    self?.delegate?.didFailWithError(failure)
                }
            }
        }
    }
}
