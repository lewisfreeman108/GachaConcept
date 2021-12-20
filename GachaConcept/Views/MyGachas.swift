//
//  MyGachas.swift
//  Test
//
//  Created by Lewis on 7/12/21.
//  Copyright © 2021 lewisfreeman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MyGachas {
    static let mySharedGachas = MyGachas()
    //var gachas: [Gacha] = []
    var publishGachas = PublishSubject<[Gacha]>()
    var gachas: [Gacha] = []
}


