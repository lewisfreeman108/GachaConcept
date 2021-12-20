//
//  GachaCell.swift
//  Test
//
//  Created by Lewis on 7/12/21.
//  Copyright © 2021 lewisfreeman. All rights reserved.
//

import UIKit

class GachaCell: UITableViewCell {
    static let identifier = "GachaCell"
    
    @IBOutlet private var gachaImage: UIImageView!
    @IBOutlet private var gachaNameLabel: UILabel!
    @IBOutlet private var gachaRarityLabel: UILabel!
    
    func configureWithGacha(gacha: Gacha) {
        gachaImage.image = UIImage(named: "Gacha\(gacha.gachaID)")
        gachaNameLabel.text = gacha.gachaName
        gachaRarityLabel.text = gacha.gachaRarity
    }
}
