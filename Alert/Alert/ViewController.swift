//
//  ViewController.swift
//  Alert
//
//  Created by do hee kim on 2022/02/10.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: Any) {
        if(isLampOn == true) {
            //UIAlertController 생성
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            //UIAlertAction 생성 (특별한 동작을 하지 않을 경우에는 handler를 nil로 함)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            //생성된 onAction을 얼럿에 추가
            lampOnAlert.addAction(onAction)
            //present 메서드 실행
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    @IBAction func btnLampOff(_ sender: Any) {
        if isLampOn {
            //UIAlertController 생성
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            //UIAlertAction 생성, 전구를 꺼야 하므로 핸들러에 {}를 넣어 추가 작업(반드시 self를 붙여야 함!!)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            //UIAlertAction 추가 생성
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            //생성된 Action들을 alert에 추가
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            //present 메서드 실행
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    @IBAction func btnLampRemove(_ sender: Any) {
        //UIAlertController 생성
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        //UIAlertAction 생성, 전구 끄기 Action
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: { ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        //UIAlertAction 생성, 전구 켜기 Action
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertAction.Style.default, handler: { ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        //UIAlertAction 생성, 전구 제거 Action
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.destructive, handler: { ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        //생성된 Action들 Alert에 추가
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        //present 메서드 실행
        present(lampRemoveAlert, animated: true, completion: nil)
    }
    
}

