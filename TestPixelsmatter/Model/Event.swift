//
//  Event.swift
//  TestPixelsmatter
//
//  Created by Oleg Granchenko on 06.08.2020.
//  Copyright © 2020 Oleg Granchenko. All rights reserved.
//

import UIKit

struct Event: Decodable {
    let events: [Events]
}

struct Events: Decodable {
    let id: Int
    let name: String
    let active: Bool
}
