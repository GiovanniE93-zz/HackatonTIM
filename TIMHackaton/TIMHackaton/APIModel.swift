//
//  APIModel.swift
//  TimHackServer
//
//  Created by Giovanni Erpete on 04/07/2020.
//  Copyright © 2020 Giovanni Erpete. All rights reserved.
//

import Foundation

struct Pollutions : Codable {
    
    let co : String?
    let so2 : String?
    let o3 : String?
    let no2 : String?
    let pm1 : String?
    let pm2_5 : String?
    let pm10 : String?
    
}

struct AirQualityData : Codable {
    
    let iqaValue : String?
    let pollutants : Pollutions?
    let timestamp : Double?
    
}

