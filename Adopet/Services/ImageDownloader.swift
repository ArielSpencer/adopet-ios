//
//  ImageDownloader.swift
//  Adopet
//
//  Created by Ariel Spencer on 02/01/25.
//

import UIKit

class ImageDownloader {
    func downloadImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                completion(UIImage(data: data))
            }
        }.resume()
    }
}
