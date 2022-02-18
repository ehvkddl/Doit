//
//  ViewController.swift
//  Navigation
//
//  Created by do hee kim on 2022/02/19.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    //세그웨이 이용해 화면 전환
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController //세그웨이의 도착 컨트롤러를 EditViewController 형태를 가지는 segue.destination ViewController로 선언
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar button"
        }
        //수정화면으로 메시지와 전구 상태 전달
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn //수정화면의 isOn에 메인화면의 전구 상태 전달
        editViewController.delegate = self
    }

    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn == true {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
}

