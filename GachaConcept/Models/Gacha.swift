//
//  Gacha.swift
//  Test
//
//  Created by Lewis on 7/12/21.
//  Copyright © 2021 lewisfreeman. All rights reserved.
//

import Foundation

struct Gacha: Equatable, Hashable {
    let gachaID: Int
    let gachaName:String
    let gachaRarity: String
    
    init(gachaID: Int) {
        self.gachaID = gachaID
        switch gachaID {
            case 1:
            gachaName = "Gatchamon"
            gachaRarity = "Common"
            case 2:
            gachaName = "Paytomon"
            gachaRarity = "Uncommon"
            case 3:
            gachaName = "Winomon"
            gachaRarity = "Common"
            case 4:
            gachaName = "Freetomon"
            gachaRarity = "Uncommon"
            case 5:
            gachaName = "Shinymon"
            gachaRarity = "Rare"
            case 6:
            gachaName = "Winnonomon"
            gachaRarity = "Common"
            case 7:
            gachaName = "Winpayomon"
            gachaRarity = "Common"
            case 8:
            gachaName = "Altomon"
            gachaRarity = "Common"
            case 9:
            gachaName = "Nanomon"
            gachaRarity = "Common"
            case 10:
            gachaName = "Elatomon"
            gachaRarity = "Uncommon"
            
            default:
                gachaName = "Error"
                gachaRarity = "Error"
        }
    }
    
}
