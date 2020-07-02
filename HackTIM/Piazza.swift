//
//  Piazza.swift
//  HackTIM
//
//  Created by Antonio Cangiano on 02/07/2020.
//  Copyright © 2020 Antonio Cangiano. All rights reserved.
//

import Foundation
class Hero {
    
    var name: String?
    var team: String?
    var imageUrl: String?
    
    init(name: String?, team: String?, imageUrl: String?) {
        self.name = name
        self.team = team
        self.imageUrl = imageUrl
    }
}
