//
//  ViewController.swift
//  ImageViewMission
//
//  Created by do hee kim on 2022/02/18.
//

import UIKit

class ViewController: UIViewController {
    var numImage: Int = 1
    let maxImage: Int = 6
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage(named: "\(numImage).png")
    }

    @IBAction func btnPrevious(_ sender: UIButton) {
        if (numImage <= 1) {
            numImage = maxImage
        } else {
            numImage -= 1
        }
        imgView.image = UIImage(named: "\(numImage).png")

    }
    @IBAction func btnNext(_ sender: UIButton) {
        if (numImage >= maxImage) {
            numImage = 1
        } else {
            numImage += 1
        }
        imgView.image = UIImage(named: "\(numImage).png")
    }
    
}

