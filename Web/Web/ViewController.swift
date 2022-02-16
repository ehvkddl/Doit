//
//  ViewController.swift
//  Web
//
//  Created by do hee kim on 2022/02/11.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
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
        myWebView.navigationDelegate = self //웹뷰가 로딩중인지 살펴보기 델리게이트
        loadWebPage("http://2sam.net")
    }

    //웹뷰가 로딩중일 때
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        //웹뷰가 로딩중일 때 인디케이터를 실행하고 화면에 나타나게 함
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    //웹뷰 로딩이 완료되었을 때
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }

    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag { //http://를 가지고 있지 않다면
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹페이지 </p> <p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html") //htmlView.html의 파일에 대한 패스 변수 생성
        let myUrl = URL(fileURLWithPath: filePath!) //패스변수를 이용하여 URL 변수 생성
        let myRequest = URLRequest(url: myUrl) //URL 변수를 이용하여 Request 변수 생성
        myWebView.load(myRequest) //Request 변수를 이용하여 HTML 파일 로딩
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading() //웹 페이지의 로딩을 중지시키는 함수 호출
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload() //웹 페이지를 재로딩시키는 함수 호출
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack() //이전 웹 페이지로 이동시키는 함수 호출
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward() //다음 웹 페이지로 이동시키는 함수 호출
    }
}
