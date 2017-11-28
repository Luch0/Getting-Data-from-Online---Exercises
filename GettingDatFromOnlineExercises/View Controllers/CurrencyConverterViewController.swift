//
//  CurrencyConverterViewController.swift
//  GettingDatFromOnlineExercises
//
//  Created by Luis Calle on 11/27/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController {

    @IBOutlet weak var basePickerVIew: UIPickerView!
    @IBOutlet weak var currencyTwoPickerView: UIPickerView!
    
    var allCurrencies = [String]()
    
    var baseCurrency: Currency? {
        didSet {
            allCurrencies = (baseCurrency!.rates.keys + [baseCurrency!.base]).sorted()
            basePickerVIew.reloadAllComponents()
            currencyTwoPickerView.reloadAllComponents()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basePickerVIew.delegate = self
        basePickerVIew.dataSource = self
        currencyTwoPickerView.delegate = self
        currencyTwoPickerView.dataSource = self
        loadData()
    }
    
    func loadData() {
        let url = "https://api.fixer.io/latest?base=USD"
        let completion: (Currency) -> Void = {(currency: Currency) in
            self.baseCurrency = currency
        }
        CurrencyAPIClient.manager.getCurrency(from: url,
                                             completionHandler: completion,
                                             errorHandler: {print($0)})
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CurrencyConverterViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allCurrencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.allCurrencies[row]
    }
}
