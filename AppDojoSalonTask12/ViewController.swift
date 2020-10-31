//
//  ViewController.swift
//  AppDojoSalonTask12
//
//  Created by 守屋譲司 on 2020/10/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var priceTextField: UITextField!
    @IBOutlet private weak var taxTextField: UITextField!
    @IBOutlet private weak var taxIncludedPriceLabel: UILabel!
    
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taxTextField.text = defaults.string(forKey: UserDefaultsKey.tax)
    }

    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let price = Double(priceTextField.text!) ?? 0
        let tax = Double(taxTextField.text!) ?? 0
        let taxIncludedPrice = Int(price * (tax / 100 + 1) )
        taxIncludedPriceLabel.text = String(taxIncludedPrice)
        
        defaults.set(String(tax), forKey: UserDefaultsKey.tax)
    }
}

