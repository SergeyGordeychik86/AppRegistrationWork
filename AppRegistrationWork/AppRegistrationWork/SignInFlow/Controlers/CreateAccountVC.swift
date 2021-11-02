//
//  CreateAccountVC.swift
//  AppRegistrationWork
//
//  Created by MacBook on 09.02.2021.
//

import UIKit

class CreateAccountVC: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var sinUpOut: UIButton!
    
    var userModel: UserModel = UserModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func emailTFAct(_ sender: UITextField) {
       sinUpOut.isEnabled = isValidEmail(sender.text ?? "")
       
    }
    
   
    @IBAction func didEndTFEmail(_ sender: UITextField) {
        errorLabel.isHidden = isValidEmail(sender.text ?? "")
    }
    
    @IBAction func beginEmail(_ sender: UITextField) {
        errorLabel.isHidden = true
    }
    
    
    
    @IBAction func signUpAct() {
        
       if let verificationVC = storyboard?.instantiateViewController(identifier: "VerifcationCodeVC") as? VerifcationCodeVC {
        verificationVC.userModel.email = emailTF.text
        
            navigationController?.pushViewController(verificationVC, animated: true)
        
        }
        
        
    }
    
    


    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx =
            "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@",
            emailRegEx)
        return emailPred.evaluate(with: email)
    }

}
