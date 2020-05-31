//
//  ViewController.swift
//  test
//
//  Created by Kim on 2020/05/24.
//  Copyright © 2020 Comp420. All rights reserved.
//
import AudioToolbox
import UIKit

class ViewController: UIViewController {

    var time = 10 // 소요기간 여기에 넣으면 됨
    var timer = Timer()
    var startTimer = false
    @IBOutlet weak var timeDown: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var State: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedButton(_ sender: UIButton){
        sender.setTitle("알람 설정 완료", for: UIControl.State.normal)
        if startTimer == false{
            startTimer = true
            timeLimitStart()
        }
    }
    
    func timeLimitStart() {
        State.text = "[상태 : 가는 중]"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: "timeLimit", userInfo: nil, repeats: true)
    }
    @objc func timeLimit() {
        if time > 0 {
            time -= 1
            timeDown.text = "잔여시간 \(time/60)분\(time%60)초"
        }
        else{
            timeLimitStop()
        }
    }
    
    func timeLimitStop() {
        startTimer = false
        timer.invalidate()
        timeDown.text = "타이머 종료"
        State.text = "[상태 : 2 정거장 전]"
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    

    


}

