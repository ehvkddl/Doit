//
//  AddViewController.swift
//  Table
//
//  Created by do hee kim on 2022/02/21.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!) //items에 텍스트 필드의 텍스트 값 추가
        itemsImageFile.append("clock.png")
        tfAddItem.text = "" //텍스트 필드의 내용 지움
        _ = navigationController?.popViewController(animated: true) //테이블 뷰(루트 컨트롤러)로 돌아감.
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
