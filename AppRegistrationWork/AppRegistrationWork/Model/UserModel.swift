//
//  UserModel.swift
//  AppRegistrationWork
//
//  Created by MacBook on 06.02.2021.
//

import Foundation



enum Genders: String, Codable {
    case men
    case women
}

struct AdditionalInfo: Codable {
    var gender: Genders?
    var dataOfBirds: Date?
    var isSmoking: Bool?
    var isVegaterian: Bool?
    var numOfChildrens: Int?
}

struct UserModel: Codable {
    var email: String?
    var password: String?
    var name: String?
    var surname: String?
    var addInfo: AdditionalInfo?
}

































