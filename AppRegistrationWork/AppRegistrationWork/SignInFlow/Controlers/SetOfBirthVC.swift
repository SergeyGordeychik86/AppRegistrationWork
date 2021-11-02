//
//  SetOfBirthVC.swift
//  AppRegistrationWork
//
//  Created by MacBook on 14.02.2021.
//

import UIKit

class SetOfBirthVC: UIViewController {
    var userModel: UserModel = UserModel()
    
    @IBOutlet weak var labelDatePickerOut: UILabel!
    
    @IBOutlet weak var partImageOne: UIImageView!
    
    @IBOutlet weak var partImageTwo: UIImageView!
    
    @IBOutlet weak var datePickerOut: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partImageOne.loadGif(name: "Birth-1")
        partImageTwo.loadGif(name: "Birth-1")
        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func datePickerAct(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        let dateValue = dateFormatter.string(from: sender.date)
        labelDatePickerOut.text = dateValue
    }
    
    @IBAction func saveDataBtnAct() {
        userModel.addInfo?.dataOfBirds = datePickerOut.date
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
