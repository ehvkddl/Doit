//
//  ViewController.swift
//  WebMission
//
//  Created by do hee kim on 2022/02/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html") //htmlView.html의 파일에 대한 패스 변수 생성
        let myUrl = URL(fileURLWithPath: filePath!) //url -> URL
        let myRequest = URLRequest(url: myUrl) //URL -> URLRequest
        myWebView.load(myRequest)
    }


}

