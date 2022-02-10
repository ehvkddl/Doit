//
//  ViewController.swift
//  Web
//
//  Created by do hee kim on 2022/02/11.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView! //WebKit import 필요
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    //웹을 처음 시작할 때 기본적으로 특정 웹페이지 보여주기
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url) //url 값을 받아 URL형으로 선언
        let myRequest = URLRequest(url: myUrl!) //상수 myUrl을 받아 Request형으로 선언
        myWebView.load(myRequest) //UIWebView형의 myWebView 클래스의 load 메소드 호출
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebPage("http://2sam.net")
    }


    @IBAction func btnGotoUrl(_ sender: UIButton) {
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
    }
}
