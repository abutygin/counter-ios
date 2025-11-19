//
//  ViewController.swift
//  Counter
//
//  Created by ALEXANDER BUTYGIN on 18.11.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var incrementButton: UIButton!
    private var counterNumber: Int = 0
    private var counterText: String {
        "Значение счётчика: \(counterNumber)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = getCounterText()
    }

    private func getCounterText() -> String {
        return "Значение счётчика: \(counterNumber)"
    }

    @IBAction private func incrementButtonDidTap() {
        counterNumber += 1
        counterLabel.text = counterText
    }
}

