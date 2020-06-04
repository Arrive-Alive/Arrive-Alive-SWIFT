//
//  Line_ViewController.swift
//  Arrive-Alive
//
//  Created by pjh on 2020/05/23.
//  Copyright © 2020 COMP420. All rights reserved.
//

import UIKit
import Foundation

class Line_ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, StreamDelegate {

    let ad = UIApplication.shared.delegate as? AppDelegate
    var line = ["1호선", "2호선", "3호선"]
    var selectRow = 0
    var get_station = ""
    
    @IBOutlet weak var line_picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        line_picker.delegate = self
        line_picker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return line.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return line[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectRow = row
    }
    
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        switch (eventCode) {
        case Stream.Event.hasBytesAvailable :
            let iStream = aStream as! InputStream
            let buffersize = 1024
            var buffer = [UInt8](repeating :0, count : buffersize)
            iStream.read(&buffer, maxLength: buffersize)
            get_station = String(bytes: buffer, encoding: String.Encoding.utf8)!
            
        default:
            return
        }
    }
    
    @IBAction func initial_nextButton(_ sender: Any) {
        ad?.paramLine = line[selectRow]
        self.presentingViewController?.dismiss(animated: true)
        
        // ip
        let host_address = "20.20.1.151"
        let host_port = 9999
        var input : InputStream?
        var output : OutputStream?
        
        Stream.getStreamsToHost(withName: host_address, port: host_port, inputStream: &input, outputStream: &output)
        output!.open()

        input?.delegate = self
        let myRunLoop = RunLoop.current
        input?.schedule(in: myRunLoop, forMode: RunLoop.Mode.default)
        input!.open()
        
        let msg = "1@" + line[selectRow] + ";"
        print(msg)
        guard (output != nil) else { return }
        let outData = msg.data(using: .utf8)
        
        outData?.withUnsafeBytes({ (p: UnsafePointer<UInt8>) -> Void in
            output!.write(p, maxLength: (outData?.count)!)
        })
        
        stream(input!, handle: Stream.Event.hasBytesAvailable)
        input!.close()
        output!.close()
        // ip
            
        //var get_station 에 호선에 해당하는 역들이 들어옴 -> 서버에서 받아오는 값
        get_station = get_station.replacingOccurrences(of: "\0", with: "")
        get_station = get_station.replacingOccurrences(of: "1@", with: "")
        ad?.paramStation = get_station.components(separatedBy: "@")
    }
}
