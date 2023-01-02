//
//  MarvelHero.swift
//  fkn_ios_lab1
//
//  Created by Серж Банковский on 03.01.2023.
//  Copyright © 2023 Серж Банковский. All rights reserved.
//

import Foundation

import UIKit

struct MarvelHero {
    var image: UIImage
    var heroName: String
    
    static func fetchHeroes() -> [MarvelHero] {
        return [
            MarvelHero(image: UIImage(named: "deadpool")!, heroName: "Deadpool"),
            MarvelHero(image: UIImage(named: "ironman")!, heroName: "Ironman"),
            MarvelHero(image: UIImage(named: "captainamerica")!, heroName: "Captain America"),
            MarvelHero(image: UIImage(named: "spiderman")!, heroName: "Spiderman"),
            MarvelHero(image: UIImage(named: "doctorstrange")!, heroName: "Doctor Strange"),
            MarvelHero(image: UIImage(named: "thor")!, heroName: "Thor"),
            MarvelHero(image: UIImage(named: "thanos")!, heroName: "Thanos")
        ]
    }
}
