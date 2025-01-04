//
//  URLHandler.swift
//  Adopet
//
//  Created by Ariel Spencer on 03/01/25.
//

import UIKit

class URLHandler {
    func openURL(_ url: URL, options:
                 [UIApplication.OpenURLOptionsKey : Any] = [:],
                 completionHandler completion: ((Bool) -> Void)? = nil) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func canOpenURL(_ url: URL) -> Bool {
        return UIApplication.shared.canOpenURL(url)
    }
}
