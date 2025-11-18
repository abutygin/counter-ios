//
//  ViewController.swift
//  Counter
//
//  Created by ALEXANDER BUTYGIN on 18.11.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    private var counterNumber: Int = 0
    var counterText: String {
        "Значение счётчика: \(counterNumber)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = getCounterText()
    }

    func getCounterText() -> String {
        return "Значение счётчика: \(counterNumber)"
    }

    @IBAction func incrementButtonDidTap() {
        counterNumber += 1
        counterLabel.text = counterText
    }
}

