//
//  ViewController.swift
//  test
//
//  Created by Kim on 2020/05/24.
//  Copyright © 2020 Comp420. All rights reserved.
//
import AudioToolbox
import UIKit

class Timer_ViewController: UIViewController {
    let ad = UIApplication.shared.delegate as? AppDelegate
    var time = 10 // 소요기간 여기에 넣으면 됨
    var alarm_station = ""

    override func viewWillAppear(_ animated: Bool) {
        if let get_alarmStation = ad?.paramAlarmStation {
            alarm_station = get_alarmStation
            AlarmStation_Label.text = "예상 알람역 : " + alarm_station
        }
        if let get_time = ad?.paramTime {
            time = Int(get_time) ?? 10
            time *= 60
        }
    }
    
    var timer = Timer()
    var startTimer = false
    @IBOutlet weak var timeDown: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var State: UILabel!
    @IBOutlet weak var AlarmStation_Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedButton(_ sender: UIButton){
        if (sender.titleLabel?.text == "알람 설정") {
            sender.setTitle("알람 설정 완료", for: UIControl.State.normal)
            sender.isEnabled = false
            if startTimer == false{
                startTimer = true
                timeLimitStart()
            }
        }
        else if (sender.titleLabel?.text == "알람 끄기"){
            sender.setTitle("시작 화면", for: UIControl.State.normal)
            AudioServicesDisposeSystemSoundID(SystemSoundID(kSystemSoundID_Vibrate))
        }
        else {
            self.dismiss(animated: true, completion: {});
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func timeLimitStart() {
        State.text = "상태 : 가는 중"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: "timeLimit", userInfo: nil, repeats: true)
    }
    
    @objc func timeLimit() {
        if time > 0 {
            time -= 1
            timeDown.text = "남은 시간 : \(time/60)분 \(time%60)초"
        }
        else{
            timeLimitStop()
        }
    }
    
    @IBOutlet weak var Control_Button: UIButton!
    
    func timeLimitStop() {
        startTimer = false
        timer.invalidate()
        timeDown.text = "타이머 종료"
        State.text = "상태 : 2정거장 전"
        Control_Button.isEnabled = true
        Control_Button.setTitle("알람 끄기", for: .normal)

        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
}

