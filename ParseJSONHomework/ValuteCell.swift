//
//  ValuteCell.swift
//  ParseJSONHomework
//
//  Created by Andrey Markov on 2020-10-14.
//

import UIKit
class ValuteCell: UITableViewCell {
    
    @IBOutlet weak var valuteLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var previousLabel: UILabel!
    func configure(with valute: Valute) {
        valuteLabel.text = String(valute.Name ?? "")
        currentLabel.text = String(valute.Value ?? 0)
        previousLabel.text = String(valute.Previous ?? 0)
    }
}

