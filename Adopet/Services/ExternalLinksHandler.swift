//
//  ExternalLinksHandler.swift
//  Adopet
//
//  Created by Ariel Spencer on 02/01/25.
//

import UIKit

class ExternalLinksHandler {
    
    private var urlHandler = URLHandler()
    
    func openTelephoneUrl(phoneNumber: String) {
        if let telephoneURL = URL(string: "tel://\(phoneNumber)") {
            urlHandler.openURL(telephoneURL)
        }
    }
    
    func openWhatsappUrl(phoneNumber: String, message: String) {
        guard let whatsappURL = URL(string: "whatsapp://send?phone=\(phoneNumber)&text=\(message)") else { return }
        
        if urlHandler.canOpenURL(whatsappURL) {
            urlHandler.openURL(whatsappURL)
        } else {
            openWhatsappInAppStore()
        }
    }
    
    func openWhatsappInAppStore() {
        guard let appStoreURL = URL(string: "https://apps.apple.com/app/whatsapp-messenger/id310633997") else { return }
        urlHandler.openURL(appStoreURL)
    }
}
