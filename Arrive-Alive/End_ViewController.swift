//
//  End_ViewController.swift
//  Arrive-Alive
//
//  Created by pjh on 2020/05/23.
//  Copyright © 2020 COMP420. All rights reserved.
//

import UIKit

class End_ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, StreamDelegate {
    let ad = UIApplication.shared.delegate as? AppDelegate
    var end = [""]
    var get_leftTime = ""
    
    override func viewWillAppear(_ animated: Bool) {
        if let get_station = ad?.paramStation {
            end = get_station
        }
    }
    
    var selectRow = 0
    
    @IBOutlet weak var end_picker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        end_picker.delegate = self
        end_picker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return end.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return end[row]
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
            get_leftTime = String(bytes: buffer, encoding: String.Encoding.utf8)!
            
        default:
            return
        }
    }
    
    @IBAction func end_alarmButton(_ sender: Any) {
        ad?.paramEnd = end[selectRow]
        self.presentingViewController?.dismiss(animated: true)
        var send_value_array = ["", "", "", ""]
        
        if let get_cityName = ad?.paramLocation {
            send_value_array[0] = get_cityName
        }
        
        if let get_line = ad?.paramLine {
            send_value_array[1] = get_line
        }
        
        if let get_start = ad?.paramStart {
            send_value_array[2] = get_start
        }
        
        if let get_end = ad?.paramEnd {
            send_value_array[3] = get_end
        }
        
        let send_data = "3@" + send_value_array.joined(separator : "@") + ";"
        print("sending_data : " + send_data)
        
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
        
        let msg = send_data
        guard (output != nil) else { return }
        let outData = msg.data(using: .utf8)
        
        outData?.withUnsafeBytes({ (p: UnsafePointer<UInt8>) -> Void in
            output!.write(p, maxLength: (outData?.count)!)
        })
        
        stream(input!, handle: Stream.Event.hasBytesAvailable)
        input!.close()
        output!.close()
        // ip
        
        get_leftTime = get_leftTime.replacingOccurrences(of: "\0", with: "")
        let leftTime = get_leftTime.components(separatedBy: "@")
        
        if (leftTime[0] == "0") {
            let dialog = UIAlertController(title: "선택 불가", message: "출발역으로부터 2정거장 이내에요", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            dialog.addAction(action)
            self.present(dialog, animated: true, completion: nil)
        }
        else {
            ad?.paramAlarmStation = leftTime[1]
            ad?.paramTime = leftTime[2]
            
            print(leftTime[1] + " " + leftTime[2])
        }
    }
}
