//
//  WebService.swift
//  MyColors
//
//  Created by Matt Deuschle on 4/20/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import Foundation

typealias Handler = (Bool, [Color]?) -> Void

struct WebService {

    static let shared = WebService()

    func download(completion: @escaping Handler) {
        let urlString = "http://www.colourlovers.com/api/colors?format=json"
        guard let url = URL(string: urlString) else {
            completion(false, nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if data != nil && error == nil {
                do {
                    let colors = try JSONDecoder().decode([Color].self, from: data!)
                    completion(true, colors)
                } catch {
                    print(error)
                }
            } else {
                completion(false, nil)
            }
        }
        task.resume()
    }
}
