//
//  ViewControllerViewModel.swift
//  SampleApp
//
//  Created by admin on 28/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewControllerViewModel {

     func saveStudent(name:String,subject:String,className:String,marks:Int){
        
        var student = Student()
        student.name = name
        student.marks =  marks
        student.subject = subject
        student.className = className
        if student.marks >= 40 {
            student.passed = true
        }

        var arrStudents =    self.getStudents()
        arrStudents.append(student)
        //Save as JSon
        let data = arrStudents.map { try? JSONEncoder().encode($0)}
        UserDefaults.standard.set(data, forKey: "SavedStudents")
        UserDefaults.standard.synchronize()
    }
    
    private func getStudents()->[Student]{
        if let data = UserDefaults.standard.array(forKey: "SavedStudents") as? [Data] {
            
            return data.map({try! JSONDecoder().decode(Student.self, from: $0)})
        }
        return [Student]()
    }
    
    func getDetialViewModel()->DetailViewModel{
        let arrStudentModels = self.getStudents().map({return StudentViewModel(student: $0)})
        let viewModel = DetailViewModel(arrStudentsModel: arrStudentModels)
        return viewModel
    }
}
