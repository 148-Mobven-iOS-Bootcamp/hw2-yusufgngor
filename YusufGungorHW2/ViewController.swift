//
//  ViewController.swift
//  YusufGungorHW2
//
//  Created by Yusuf Güngör on 23.12.2021.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var changableText: UILabel!
    
    let nc = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SecondViewController.delegate = self
        SecondViewController.myClosure = { value in
            self.changableText.text = value
        }
        
        nc.addObserver(self, selector: #selector(changeTextWithDelegate(_:)), name: .changeTextNM, object: nil )
        // Do any additional setup after loading the view.
        
      
    
        
    }
  
    @objc func changeTextWithDelegate(_ notification: Notification)  {
        changableText.text = notification.object as? String
    }
    
    

}

extension ViewController : changeTextDelegate {
    func changeText(text: String) {
        changableText.text = text
    }
}


