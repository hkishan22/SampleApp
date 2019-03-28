//
//  DetailViewModel.swift
//  SampleApp
//
//  Created by admin on 28/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DetailViewModel {
    var arrStudentsModel : [StudentViewModel]!
    
    init(arrStudentsModel: [StudentViewModel]) {
        self.arrStudentsModel = arrStudentsModel
    }
}


class StudentViewModel {
    var name : String!
    var subject : String!
    var className : String!
    var status : String!
    var statusColor : UIColor!

    init(student:Student) {
        self.name = student.name
        self.subject = student.subject
        self.className = student.className
        self.status = (student.marks < 40) ? "Fail" : "Pass"
        self.statusColor = (student.marks < 40) ? UIColor.red : UIColor.green
    }
}
