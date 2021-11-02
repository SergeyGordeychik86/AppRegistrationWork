//
//  ViewController.swift
//  AppRegistrationWork
//
//  Created by MacBook on 04.02.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageOut: UIImageView!
    @IBOutlet weak var errorLabelOut: UILabel!
    @IBOutlet weak var tokenSwichOut: UISwitch!
    
    @IBOutlet weak var emailTfOut: UITextField!
    @IBOutlet weak var passTfOut: UITextField!
    
    @IBOutlet weak var signINOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        if checkToken() {
            performSegue(withIdentifier: "goMainStoryboard", sender: nil)
        }
        }
    
    @IBAction func enailTFAct(_ sender: UITextField) {
        signINOut.isEnabled = isEmptyTF()
    }
    
    @IBAction func signInButtonAct() {
//        TODO: - check
        
        if isValidEmail(emailTfOut.text ?? "") {
//            saveCredantials()
            saveToken()
            
            
            
//            print("isValidEmail")
//            print(UserDefaults.standard.string(forKey: "email"))
//            print(UserDefaults.standard.string(forKey: "password"))
            
        } else {
            errorLabelOut.isHidden = false
            errorLabelOut.text = "Email is not valid"
        }
   }
    
    @IBAction func unwindToSignIn(_ unwindSegue: UIStoryboardSegue) {
       let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    private func saveCredantials() {
        UserDefaults.standard.set(emailTfOut.text, forKey: "email")
        UserDefaults.standard.set(passTfOut.text, forKey: "password")
    }
    
    private func saveToken() {
        if tokenSwichOut.isOn{
            let date = Data()
            UserDefaults.standard.set(date, forKey: "date")
        }
    }
    
    
    @IBAction func passTFAct(_ sender: UITextField) {
        signINOut.isEnabled = isEmptyTF()
    }
    
    
    
//    operation TextField
    private func isEmptyTF() -> Bool {
        errorLabelOut.isHidden = true
        if let emailTFText = emailTfOut.text,
           let passTFText = passTfOut.text {
            
            return !emailTFText.isEmpty && !passTFText.isEmpty
        } else {
          return false
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx =
            "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@",
            emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func checkToken() -> Bool {
        if let date = UserDefaults.standard.object(forKey: "date") as? Date,
           let earlyDate = Calendar.current.date(
            byAdding: .minute,
            value: -1,
            to: Date()) {
            return earlyDate <= date
        } else {
            return false
        }
    }
    
}
