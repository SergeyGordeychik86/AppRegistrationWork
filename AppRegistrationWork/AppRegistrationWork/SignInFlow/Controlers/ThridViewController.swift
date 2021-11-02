//
//  ThridViewController.swift
//  AppRegistrationWork
//
//  Created by MacBook on 08.02.2021.
//

import UIKit

class ThridViewController: UIViewController {
    var userModel: UserModel = UserModel()
    
    @IBOutlet weak var imageMenOut: UIImageView!
    @IBOutlet weak var imageWomenOut: UIImageView!
    @IBOutlet weak var labelStartSwitchOut: UILabel!
    
    @IBOutlet weak var segmentedOut: UISegmentedControl!
    @IBOutlet weak var textfNameOut: UITextField!
    @IBOutlet weak var textfSurnameOut: UITextField!
    
    @IBOutlet weak var saveDataOut: UIButton!
    @IBOutlet weak var imageFurstOut: UIImageView!

    @IBOutlet weak var segmentSmokeOut: UISegmentedControl!
    
    @IBOutlet weak var segmentVegeterianceOut: UISegmentedControl!
    @IBOutlet weak var stackViewSmokeOut: UIStackView!
    @IBOutlet weak var stackViewVegetOut: UIStackView!
    
    @IBOutlet weak var buttonSetBirthdayOut: UIButton!
    

    
    @IBOutlet weak var switchOut: UISwitch!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func segmentedAction() {
        isHiddenSwitchTrue()
        
        if segmentedOut.selectedSegmentIndex == 0 {
            imageMenOut.isHidden = !imageMenOut.isHidden
            imageWomenOut.isHidden = true
            imageFurstOut.isHidden = true
        } else
        if segmentedOut.selectedSegmentIndex == 1 {
            imageWomenOut.isHidden = !imageWomenOut.isHidden
                imageMenOut.isHidden = true
            imageFurstOut.isHidden = true
        } else
        if segmentedOut.selectedSegmentIndex == 2 {
            imageFurstOut.isHidden = !imageFurstOut.isHidden
            imageMenOut.isHidden = true
            imageWomenOut.isHidden = true
        }
    }
    
    @IBAction func textfNameAct(_ sender: UITextField) {
        saveDataOut.isEnabled = isEmptyTF()
        isHiddenSwitchTrue()
        
    }
    
    @IBAction func textfSurnameAct(_ sender: UITextField) {
        saveDataOut.isEnabled = isEmptyTF()
        isHiddenSwitchTrue()
        if textfSurnameOut.text == textfSurnameOut.text && textfNameOut.text == textfNameOut.text {
            saveDataOut.isHidden = false
        
            
        }
    }
    
    @IBAction func switchAct(_ sender: UISwitch) {
        
        labelStartSwitchOut.isHidden = true
        segmentedOut.isHidden = !segmentedOut.isHidden
    textfNameOut.isHidden = !textfNameOut.isHidden
        textfSurnameOut.isHidden = !textfSurnameOut.isHidden
        
        stackViewSmokeOut.isHidden = !stackViewSmokeOut.isHidden
        stackViewVegetOut.isHidden = !stackViewVegetOut.isHidden
        buttonSetBirthdayOut.isHidden = !buttonSetBirthdayOut.isHidden
        }
   
    
    @IBAction func switchSmoke(_ sender: UISwitch) {
        if sender.isOn {
        segmentSmokeOut.isEnabled = true
        } else if  sender.isOn == false {
            segmentSmokeOut.isEnabled = false
            
        }
        
    }
    @IBAction func switchVegeteriance(_ sender: UISwitch) {
        if sender.isOn {
            segmentVegeterianceOut.isEnabled = true
        } else if sender.isOn == false {
            segmentVegeterianceOut.isEnabled = false
        }
    }
    
    @IBAction func saveDataBtnAct() {
        userModel.name = textfNameOut.text
        userModel.surname = textfSurnameOut.text
        userModel.addInfo?.gender = segmentedOut.selectedSegmentIndex == 0 ? Genders.men : Genders.women
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(userModel), forKey: "user")
        if let mainVC = storyboard?.instantiateViewController(identifier: "MainVC") as? MainVC {
            mainVC.userModel = userModel
          navigationController?.pushViewController(mainVC, animated: true)
        }
    }
    
    private func isHiddenSwitchTrue() {
        switchOut.isHidden = true
    }
    
    
    private func isEmptyTF() -> Bool {
        if let nameTF = textfNameOut.text,
           let surnameTF = textfSurnameOut.text {
           return !nameTF.isEmpty && !surnameTF.isEmpty
            
        } else {
            return false
        }
    }
        }
