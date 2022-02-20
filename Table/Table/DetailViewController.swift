//
//  DeatilViewController.swift
//  Table
//
//  Created by do hee kim on 2022/02/21.
//

import UIKit

class DetailViewController: UIViewController {

    //메인화면에서 받을 텍스트를 위한 변수
    var receiveItem = ""
    
    @IBOutlet var lblItem: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem
    }
    
    //메인 뷰에서 변수를 받기 위한 함수
    func receiveItem(_ item: String)
    {
        receiveItem = item
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
