//
//  GachaViewController.swift
//  Test
//
//  Created by Lewis on 7/12/21.
//  Copyright © 2021 lewisfreeman. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class GachaViewController: UIViewController {
    
    @IBOutlet private var gachaTextField: UITextView!
    @IBOutlet private var gachasTextField: UITextView!
    @IBOutlet private var coinLabel: UILabel!
    @IBOutlet weak var buyOneGachaButton: CustomButton!
    @IBOutlet weak var buyFiveGachaButton: CustomButton!
    
    let disposeBag = DisposeBag()
    
    let commonGacha: [Int] = [1, 3, 6, 7, 8, 9]
    let uncommonGacha: [Int] = [2, 4, 10]
    let rareGacha: [Int] = [5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfiguration()
    }
    
    @IBAction func newGatchaButtonPressed(_ sender: Any) {
        Purse.mySharedPurse.coins
            .accept(Purse.mySharedPurse.coins.value - 10)
        gachaTextField.text = "You obtained: \(getNewGacha())"
        
    }
    
    @IBAction func fiveNewGachaButtonPressed(_ sender: Any) {
        gachasTextField.text = ""
        Purse.mySharedPurse.coins
            .accept(Purse.mySharedPurse.coins.value - 40)
        
        for _ in 0...4 {
            gachasTextField.text.append("You obtained: ID = \(getNewGacha())\n")
        }
        
        for i in 0...MyGachas.mySharedGachas.gachas.count - 1 {
            print("Gacha exists \(MyGachas.mySharedGachas.gachas[i].gachaName)")
        }
    }

    
    func getNewGacha() -> Int {
        let rarity = Int.random(in: 1...10)
        let obtainedGacha:Int
        if rarity <= 7 {
            obtainedGacha = commonGacha[Int.random(in: 0...commonGacha.count - 1)]
        } else if rarity <= 9 {
            obtainedGacha = uncommonGacha[Int.random(in: 0...uncommonGacha.count - 1)]
        } else {
            obtainedGacha = rareGacha[Int.random(in: 0...rareGacha.count - 1)]
        }
        
        MyGachas.mySharedGachas.gachas.append(Gacha(gachaID: obtainedGacha))
    
        MyGachas.mySharedGachas.publishGachas.onNext(MyGachas.mySharedGachas.gachas)
        
        return obtainedGacha
    }
    
    func setupConfiguration() {
        
        Purse.mySharedPurse.coinLabel.bind(to: coinLabel.rx.text).disposed(by: disposeBag)
        
        setUpGachaButton(cost: 10, gachaButton: buyOneGachaButton);
        setUpGachaButton(cost: 40, gachaButton: buyFiveGachaButton);
        
        
    }
    
    func setUpGachaButton(cost:Int, gachaButton:CustomButton) {
        Purse.mySharedPurse.coins
         .asObservable()
         .map { (Int) -> Bool in
             return Purse.mySharedPurse.coins.value >= cost
            }
        .bind(to: gachaButton.rx.isEnabled).disposed(by: disposeBag)
    }
    
}
