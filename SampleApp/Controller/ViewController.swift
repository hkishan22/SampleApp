//
//  ViewController.swift
//  SampleApp
//
//  Created by admin on 27/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


struct Student:Codable {
    var name: String!
    var className: String!
    var marks : Int!
    var subject: String!
    var passed:Bool = false
    
    static func saveStudent(student:Student){
        var arrStudents =    self.getStudents()
        arrStudents.append(student)
        //Save as JSon
        let data = arrStudents.map { try? JSONEncoder().encode($0)}
        UserDefaults.standard.set(data, forKey: "SavedStudents")
        UserDefaults.standard.synchronize()
    }
    
    static func getStudents()->[Student]{
        if let data = UserDefaults.standard.array(forKey: "SavedStudents") as? [Data] {
            
            return data.map({try! JSONDecoder().decode(Student.self, from: $0)})
        }
        return [Student]()
    }}


class ViewController: UIViewController {

    var arrSubjects = ["Maths", "Physics", "Chemistry"]
    
    @IBOutlet  weak var textfName: UITextField!
    @IBOutlet  weak var textfClass: UITextField!
    @IBOutlet  weak var textfMarks: UITextField!
    @IBOutlet  weak var textfSubject: UITextField!

    var pickerView = UIPickerView()
    
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
            var student = Student()
            student.name = self.textfName.text
            student.marks =  Int(self.textfMarks.text ?? "0")
            student.subject = self.textfSubject.text
            student.className = self.textfClass.text
            if student.marks >= 40 {
                student.passed = true
            }
            Student.saveStudent(student: student)
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
