//
//  UIImageLoadingExtension.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 28.01.2021.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadFrom(imageUrl: String) {
        
        guard let url = URL(string: imageUrl) else { return }
        
        //Set configuration for caching images to path
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(memoryCapacity: 1024 * 1024 * 50, diskCapacity: 1024 * 1024 * 500, diskPath: "images")
        configuration.httpMaximumConnectionsPerHost = 5
        let session = URLSession(configuration: configuration)
        
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                self.image = nil
                print(error)
            }
                  
            guard let response = response as? HTTPURLResponse else {
                print(error)
                return
            }
                
            if 200 ... 299 ~= response.statusCode {
                DispatchQueue.main.async {
                    guard let data = data else { return }
                    self.image = UIImage(data: data)
                    self.layoutSubviews()
                }
            } else {
                self.image = nil
                print(error)
            }
        }.resume()
    }
}
