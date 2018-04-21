//
//  Color.swift
//  MyColors
//
//  Created by Matt Deuschle on 4/20/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

struct Color: Codable {
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case rank = "rank"
        case rgb = "rgb"
    }
    let title: String
    let rank: Int
    let rgb: RGB
}

struct RGB: Codable {
    private enum CodingKeys: String, CodingKey {
        case red = "red"
        case green = "green"
        case blue = "blue"
    }
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
}


