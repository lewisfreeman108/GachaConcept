//
//  Purse.swift
//  Test
//
//  Created by Lewis on 7/12/21.
//  Copyright © 2021 lewisfreeman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct Purse {
    var coinLabel: BehaviorRelay<String> = BehaviorRelay(value: "Coins: 100")
    var coins: BehaviorRelay<Int> = BehaviorRelay(value: 100)
    let disposeBag = DisposeBag()
    static let mySharedPurse = Purse()

}
