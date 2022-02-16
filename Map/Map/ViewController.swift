//
//  ViewController.swift
//  Map
//
//  Created by do hee kim on 2022/02/17.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self //locationManager의 델리게이트를 self로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization() //위치 데이터를 추적하기 위해 사용자에게 승인 요구
        locationManager.startUpdatingLocation() //위치 업데이트 시작
        myMap.showsUserLocation = true //위치 보기값을 true로 설정
    }

    //위도와 경도로 원하는 위치를 표시하기 위한 함수
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) //위도 값과 경도 값을 매개변수로 하여 함수를 호출하고, 리턴 값을 상수로 받음
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) //범위 값을 매개변수로 하여 함수를 호출하고, 리턴 값을 상수로  받음
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue) //위의 두 상수를 매개변수로 하여 함수를 호출하고 리턴 값을 상수로 받음
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    //원하는 곳에 핀을 설치하기 위한 함수
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String) {
        let annotation = MKPointAnnotation() //핀을 설치하기위한 함수
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span) //annotation의 coordinate 값은 CLLocationCoordinate2D형태로 받아야 함.
        annotation.title = strTitle //핀의 타이틀
        annotation.subtitle = strSubtitle //핀의 서브타이틀
        myMap.addAnnotation(annotation) //맵 뷰에 annotation 값 추가
    }
    
    //위치가 업데이트되었을 때 지도에 위치를 나타내기 위한 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last //위치가 업데이트되면 먼저 마지막 위치 값을 찾아냄
        _=goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01) //마지막 위치의 위도와 경도 값을 가지고 앞에서 만든 goLocation 함수를 호출. delta값은 지도의 크기를 결정(값이 작을수록 확대)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: { //위도와 경도 값을 가지고 주소 찾는 함수
            (placemarks, error) -> Void in
            let pm = placemarks!.first //placemarks 값의 첫 부분만 pm 상수로 대입
            let country = pm!.country //pm상수에서 나라 값을 country 상수에 대입
            var address: String = country! //문자열 address에 country 상수의 값을 대입
            if pm!.locality != nil { //pm상수에서 지역 값이 존재하면 address 문자열에 추가
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil { //pm상수에서 도로 값이 존재하면 address 문자열에 추가
                address += " "
                address += pm!.thoroughfare!
            }
            self.lblLocationInfo1.text = "현재 위치" //레이블에 "현재 위치" 텍스트 표시
            self.lblLocationInfo2.text = address //레이블에 address 문자열의 값 표시
        })
        locationManager.stopUpdatingLocation() //위치 업데이트 멈춤
    }

    //세그먼트 선택 작동 액션
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            //현재 위치 표시
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = "" //레이블 값을 초기화해야 기존에 작성되어 있던 텍스트를 삭제하고 현재 위치를 표시할 수 있음
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            //폴리텍 대학 표시
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        } else if sender.selectedSegmentIndex == 2 {
            //이지스퍼블리싱 표시
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        }
    }
}

