//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by do hee kim on 2022/02/23.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //사진을 촬영하고 포토 라이브러리에 저장
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) { //카메라 사용 가능 여부 확인
            flagImageSave = true //이미지 저장 허용
            
            imagePicker.delegate = self //imagePicker의 델리게이트를 self로 설정
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String] //미디어타입을 kUIIypeImage로 설정
            imagePicker.allowsEditing = false //편집을 허용하지 않음
            
            present(imagePicker, animated: true, completion: nil) //뷰에 imagePicker가 보이게 함
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.") //카메라를 켤 수 없을 때는 경고창을 나타냄
        }
    }
    
    //사진 불러오기
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    //카메라를 사용해 비디오를 촬영하고 포토 라이브러리에 저장
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera")
        }
    }
    
    //비디오 불러오기
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    //버튼들의 기능이 경우에 따라 작동하게 만들어 주는 함수
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString //미디어 종류 확인
        
        if mediaType.isEqual(to: kUTTypeImage as NSString as String) { //미디어 종류가 사진일 경우
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage //사진을 가져와 captureImage에 저장
            
            if flagImageSave { //flagImageSave가 true이면 가져온 사진을 포토 라이브러리에 저장
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage
        }
        else if mediaType.isEqual(to: kUTTypeMovie as NSString as String){ //미디어 종류가 Movie일 경우
            if flagImageSave { //flagImageSave가 true이면 촬영한 비디오를 가져와 포토 라이브러리에 저장
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        self.dismiss(animated: true, completion: nil) //현재의 뷰 컨트롤러 제거(이미지 피커 화면을 제거하여 초기 뷰를 보여줌)
    }
    
    //사진이나 비디오를 찍지 않고 취소하거나 선택하지 않고 취소를 하는 경우
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil) //현재의 뷰 컨트롤러에 보이는 이미지 피커를 제거하여 초기 뷰를 보여줌
    }
    
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

