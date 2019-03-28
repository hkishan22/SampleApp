//
//  ViewController.swift
//  SampleApp
//
//  Created by admin on 27/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit




class ViewController: UIViewController {

    var arrSubjects = ["Maths", "Physics", "Chemistry"]
    
    @IBOutlet  weak var textfName: UITextField!
    @IBOutlet  weak var textfClass: UITextField!
    @IBOutlet  weak var textfMarks: UITextField!
    @IBOutlet  weak var textfSubject: UITextField!

    var pickerView = UIPickerView()
    
    let viewModel = ViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textfSubject.inputView = pickerView
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func btnSaveClicked(sender:UIButton){
        if self.textfName.text?.count == 0 {
            //Show Alert for Name
        }else if self.textfClass.text?.count == 0 {
            //Show Alert for Class
        }else if self.textfSubject.text?.count == 0 {
            //Show Alert for Subjects
        }else if self.textfMarks.text?.count == 0   {
            //Show Alert for marks
        }else if self.validateMarks() == false{
            //Show Alert for marks
        }else{
            //Save Values
            self.viewModel.saveStudent(name: self.textfName.text!, subject: self.textfSubject.text!, className: self.textfClass.text!, marks: Int(self.textfMarks.text ?? "0")!)
            self.resetAllTextFeildValues()
        }
    }
    
    

    
    private func resetAllTextFeildValues(){
        self.textfMarks.text = ""
        self.textfSubject.text = ""
        self.textfClass.text = ""
        self.textfName.text = ""
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    
    func validateMarks()->Bool{
        if  let text = self.textfMarks.text, let marks =   Int(text), marks > 100 {
                //Show Alert
            return false
        }
        return true
    }
    
    
    func createPicker(){
    
    }
}

extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrSubjects.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrSubjects[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let subject = self.arrSubjects[row]
        self.textfSubject.text = subject
    }
}

extension ViewController {
    @IBAction func detailButtonClicked(sender:UIBarButtonItem){
        let detailVC = DetailTableViewController.detailTableViewController(viewModel: self.viewModel.getDetialViewModel())
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
