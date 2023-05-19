//
//  BankModel.swift
//  ChallengeYaGanaste
//
//  Created by Fernando Maximiliano on 18/05/23.
//

import Foundation

struct BankModel: Decodable{
    let results: [BankObject]
}

struct BankObject: Decodable{
    var bankName: String
    var description: String
    var age: Int
    var url: String
}

