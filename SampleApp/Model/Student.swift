//
//  Student.swift
//  SampleApp
//
//  Created by admin on 28/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


struct Student:Codable {
    var name: String!
    var className: String!
    var marks : Int!
    var subject: String!
    var passed:Bool = false
}
