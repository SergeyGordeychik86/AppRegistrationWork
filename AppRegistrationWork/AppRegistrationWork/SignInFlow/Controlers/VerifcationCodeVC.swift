//
//  VerifcationCodeVC.swift
//  AppRegistrationWork
//
//  Created by MacBook on 09.02.2021.
//

import UIKit

class VerifcationCodeVC: UIViewController {
    var userModel: UserModel = UserModel()
    
    @IBOutlet weak var captchaImageOut: UIImageView!
    @IBOutlet weak var codeTfOut: UITextField!
    
    let captchaDict : [Int: UIImage?] = [ 0096 : UIImage(named: "captcha3"),
                                      76447 : UIImage(named: "captcha1"),]
    var currentKey: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)

       currentKey = radnomKey()
        captchaImageOut.image = captchaDict[currentKey]!
    }
    
    @IBAction func codeTfAct(_ sender: UITextField) {
        if sender.text == String (currentKey) {
            if let setPasswordVC = storyboard?.instantiateViewController(identifier: "SetPasswordVC") as? SetPasswordVC {
                setPasswordVC.userModel = userModel
                navigationController?.pushViewController(setPasswordVC, animated: true)
            }
        }
    }
    
    @IBAction func CaptchaAct() {
        
        var status = true
        repeat {
            let newKey = radnomKey()
            if newKey != currentKey {
                captchaImageOut.image = captchaDict[newKey]!
                currentKey = newKey
                status = false
            }
        } while status
            
        }
        
        
    
    private func radnomKey() -> Int {
        let index = Int.random(in: 0..<captchaDict.count)
        let key = Array (captchaDict.keys)[index]
        return key
    }
    
}
