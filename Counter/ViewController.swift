//
//  ViewController.swift
//  Counter
//
//  Created by ALEXANDER BUTYGIN on 18.11.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var logTextView: UITextView!
    private var counterNumber: Int = 0
    private var logList: [String] = ["История изменений:"]
    var counterText: String {
        "Значение счётчика: \(counterNumber)"
    }
    
    var logText: String {
        logList.joined(separator: "\n")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = counterText
        logTextView.isEditable = false
        updateLogTextView()
    }

    @IBAction func plusButtonDidTap() {
        counterNumber += 1
        counterLabel.text = counterText
        logText("значение изменено на +1")
    }
    
    @IBAction func minusButtonDidTap() {
        if counterNumber > 0 {
            counterNumber -= 1
            counterLabel.text = counterText
            logText("значение изменено на -1")
        } else {
            logText("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func resetButtonDidTap() {
        if counterNumber == 0 {
            return
        }
        counterNumber = 0
        counterLabel.text = counterText
        logText("значение сброшено")
    }
    
    func logText(_ text: String) {
        let fullRecord = currentFormattedDateAndTime() + ": " + text
        logList.append(fullRecord)
        updateLogTextView()
    }
    
    func updateLogTextView() {
        logTextView.text = logText
        logTextView.layoutManager.allowsNonContiguousLayout = false
        let bottom = NSMakeRange(logTextView.text.count - 1, 1)
        logTextView.scrollRangeToVisible(bottom)
    }
}

private extension ViewController {

    func currentFormattedDateAndTime() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }

}

