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
    var line = [""]
    var selectRow = 0
    var get_station = ""
    
    override func viewWillAppear(_ animated: Bool) {
        if let get_line = ad?.paramLines {
            line = get_line
        }
    }
    
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
        var host_address : String = ""
        var host_port : Int = 0
                
        if let get_ip = ad?.paramIP {
            host_address = get_ip
        }
        if let get_host = ad?.paramHost {
            host_port = get_host
        }
        
        var input : InputStream?
        var output : OutputStream?
        
        Stream.getStreamsToHost(withName: host_address, port: host_port, inputStream: &input, outputStream: &output)
        output!.open()

        input?.delegate = self
        let myRunLoop = RunLoop.current
        input?.schedule(in: myRunLoop, forMode: RunLoop.Mode.default)
        input!.open()

        var send_value_array = ["", ""]

        if let get_cityName = ad?.paramLocation {
            send_value_array[0] = get_cityName
        }

        send_value_array[1] = line[selectRow]
        
        let msg = "2@" + send_value_array.joined(separator : "@") + ";"
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
        get_station = get_station.replacingOccurrences(of: "2@", with: "")
        ad?.paramStation = get_station.components(separatedBy: "@")
    }
}
