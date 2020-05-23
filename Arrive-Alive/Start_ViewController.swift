//
//  Start_ViewController.swift
//  Arrive-Alive
//
//  Created by pjh on 2020/05/23.
//  Copyright © 2020 COMP420. All rights reserved.
//

import UIKit

class Start_ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let ad = UIApplication.shared.delegate as? AppDelegate
    var start = [""]
    
    override func viewWillAppear(_ animated: Bool) {
        if let get_station = ad?.paramStation {
            start = get_station
        }
    }
    
    var selectRow = 0
    
    @IBOutlet weak var start_picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start_picker.delegate = self
        start_picker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return start.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectRow = row
        return start[row]
    }
    @IBAction func start_nextButton(_ sender: Any) {
        ad?.paramStart = start[selectRow]
        self.presentingViewController?.dismiss(animated: true)
    }
}
