//
//  ViewController.swift
//  Tab
//
//  Created by do hee kim on 2022/02/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnMoveImageView(_ sender: UIButton) {
        //버튼 클릭하면 뷰 전환
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

