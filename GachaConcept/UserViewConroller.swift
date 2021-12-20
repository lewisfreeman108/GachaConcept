//
//  UserConroller.swift
//  Test
//
//  Created by Lewis on 5/12/21.
//  Copyright © 2021 lewisfreeman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class UserViewController: UIViewController {

    private let disposeBag = DisposeBag()
    @IBOutlet private var tableView: UITableView!
    
        @IBOutlet private var coinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gacha!"
        setupCellConfiguration()
        setupLabelConfiguration()
        // Do any additional setup after loading the view.
    }
    
    func setupCellConfiguration() {
        
        MyGachas.mySharedGachas.publishGachas.bind(to: tableView
            .rx
            .items(cellIdentifier: GachaCell.identifier,
                   cellType: GachaCell.self)) {
                    row, gacha, cell in
                    cell.configureWithGacha(gacha: gacha)
        }.disposed(by: disposeBag)

    }
    
    func setupLabelConfiguration() {
        Purse.mySharedPurse.coins
         .asObservable()
            .map { value -> String in
            return "Coins: \(value)"
            }
        .bind(to: Purse.mySharedPurse.coinLabel).disposed(by: Purse.mySharedPurse.disposeBag)
        
        Purse.mySharedPurse.coinLabel.bind(to: coinLabel.rx.text).disposed(by: disposeBag)
    }
    
}
