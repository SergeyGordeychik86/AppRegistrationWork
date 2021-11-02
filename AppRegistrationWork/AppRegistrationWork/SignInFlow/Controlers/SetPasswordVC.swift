//
//  SetPasswordVC.swift
//  AppRegistrationWork
//
//  Created by MacBook on 09.02.2021.
//

import UIKit

class SetPasswordVC: UIViewController {
    
    @IBOutlet weak var passTFOut: UITextField!
    @IBOutlet weak var passTFtwo: UITextField!
    
   
    @IBOutlet weak var bulbOne: UIView!
    @IBOutlet weak var bulbTwo: UIView!
    @IBOutlet weak var bulbThree: UIView!
    @IBOutlet weak var bulbFour: UIView!
    
    @IBOutlet weak var finishRegOut: UIButton!
    
    @IBOutlet weak var switchToken: UISwitch!
    
    
    
    var userModel: UserModel = UserModel()
    
    
    var passwordLevel = 0
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finshRegBtn() {
        if let setUserDataVC = storyboard?.instantiateViewController(identifier: "ThridViewController") as? ThridViewController {
            userModel.password = passTFtwo.text
            setUserDataVC.userModel = userModel
            saveToken()
            navigationController?.pushViewController(setUserDataVC, animated: true)
        }
    }
    
    @IBAction func passTF1Act(_ sender: UITextField) {
        checkValidPassword()
        isPasswordEquality()
    }
    @IBAction func passTF2Act(_ sender: UITextField) {
        isPasswordEquality()
    }
    private func isPasswordEquality()  {
        finishRegOut.isEnabled = passTFOut.text == passTFtwo.text
    }
    private func checkValidPassword() {
        let passwordWithBigCh = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z]).{6,}$")
        let passwordWithDigit = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[0-9]).{6,}$")
        let  passwordWithSpecialChar = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{6,}$")
        let passwordWithBigChAndDigit = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}$")
        let passwordWithBigChAndSpecislCh = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[0-9])(?=.*[$@$#!%*?&]).{8,}$")
        let hardestPassword = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$#!%*?&]).{10,}$")
        
        if let pass = passTFOut.text {
            switch pass {
            case _ where hardestPassword.evaluate(with: pass) :
                bulbOne.backgroundColor = .red
                bulbTwo.backgroundColor = .orange
                bulbThree.backgroundColor = .yellow
                bulbFour.backgroundColor = .green
            case _ where passwordWithBigChAndDigit.evaluate(with: pass) ||
                    passwordWithBigChAndSpecislCh.evaluate(with: pass) ||
                    passwordWithBigChAndSpecislCh.evaluate(with: pass) :
                
                bulbOne.backgroundColor = .red
                bulbTwo.backgroundColor = .orange
                bulbThree.backgroundColor = .yellow
                bulbFour.backgroundColor = .lightGray
            case _ where passwordWithDigit.evaluate(with: pass) ||
                    passwordWithBigCh.evaluate(with: pass) ||
                    passwordWithSpecialChar.evaluate(with: pass) :
                
                bulbOne.backgroundColor = .red
                bulbTwo.backgroundColor = .orange
                bulbThree.backgroundColor = .lightGray
                bulbFour.backgroundColor = .lightGray
            case _ where pass.count > 6 :
                bulbOne.backgroundColor = .red
                bulbTwo.backgroundColor = .lightGray
                bulbThree.backgroundColor = .lightGray
                bulbFour.backgroundColor = .lightGray
            default:
                bulbOne.backgroundColor = .lightGray
                bulbTwo.backgroundColor = .lightGray
                bulbThree.backgroundColor = .lightGray
                bulbFour.backgroundColor = .lightGray
            }
        }

    }
    
    private func saveToken() {
        if switchToken.isOn{
            let date = Data()
            UserDefaults.standard.set(date, forKey: "date")
        }
    }
}



