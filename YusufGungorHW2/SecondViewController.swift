//
//  SecondViewController.swift
//  YusufGungorHW2
//
//  Created by Yusuf Güngör on 25.12.2021.
//

import UIKit

protocol changeTextDelegate {
    func changeText(text:String)
    
}

class SecondViewController: UIViewController {

    static var delegate: changeTextDelegate?
    
    static var myClosure : ((String) -> Void)?
    
    let nc = NotificationCenter.default
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onChangeByNavigationCenter(_ sender: UIButton) {
        nc.post(name: .changeTextNM, object: "This text changed by using notification center")
        
    }
    
    @IBAction func onChangeByDelegate(_ sender: UIButton) {
        if SecondViewController.delegate != nil  {
            SecondViewController.delegate!.changeText(text: "This text changed by using delegate")
            
        }
        else {
            print("delegate is Unknown")
        }
        
        
    }
    @IBAction func onChangeByClosure(_ sender: UIButton) {
        SecondViewController.myClosure?("Text changed by using closure")
        
        
    }
    
}

extension Notification.Name{
    static let changeTextNM = Notification.Name("ChangeText")
    
    
}
