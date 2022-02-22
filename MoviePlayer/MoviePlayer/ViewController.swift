//
//  ViewController.swift
//  MoviePlayer
//
//  Created by do hee kim on 2022/02/23.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //앱 내부에 복사해 놓은 비디오를 재생
    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4") //비디오 파일명을 사용하여 비디오가 저장된 앱 내부의 파일 경로를 받아옴
        let url = NSURL(fileURLWithPath: filePath!) //앱 내부의 파일명을 NSURL 형식으로 변경
        
        playVideo(url: url)
    }
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        
        playVideo(url: url)
    }
    
    private func playVideo(url: NSURL) {
        let playerController = AVPlayerViewController() //AVPlayerViewController의 인스턴스 생성
        
        let player = AVPlayer(url: url as URL)//앞에서 얻은 비디오 URL로 초기화된 AVPlayer의 인스턴스 생성
        playerController.player = player //AVPlayerViewController의 player 속성에 앞에서 생성한 AVPlayer 인스턴스 할당
        
        self.present(playerController, animated: true) {
            player.play() //비디오 재생
        }
    }
}

