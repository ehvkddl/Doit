//
//  ViewController.swift
//  PickerView
//
//  Created by do hee kim on 2022/02/06.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    var imageArray = [UIImage?]()
    var imageFileName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
                         "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i]) //UIImage 타입의 이미지 생성하여 image라는 변수에 할당
            imageArray.append(image) //imageArray에 방금 만든 UIImage 타입의 이미지를 추가
        }
        //맨 처음에 기본적으로 보일 이미지와 이미지 이름
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }

    //피커 뷰에 표시되는 열의 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    //피커 뷰의 해당 열에서 선택할 수 있는 행의 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    //피커뷰에게 컴포넌트의 각 열의 타이틀을 문자열로 넘겨줌
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }

    //피커뷰의 룰렛을 돌려 원하는 열을 선택했을 때 할 일을 델리게이트에게 지시
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row] //선택된 파일명을 레이블에 출력
        imageView.image = imageArray[row]
    }
}

