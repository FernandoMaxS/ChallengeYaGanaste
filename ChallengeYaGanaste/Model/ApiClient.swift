//
//  ApiClient.swift
//  ChallengeYaGanaste
//
//  Created by Fernando Maximiliano on 18/05/23.
//

import Foundation

class ApiClient{
    //"https://api.themoviedb.org/3/movie/popular?api_key=8c764de0f1ac10af210e0b3f7186dc0b"
    func getListOfBanks() async -> [BankObject]{
        let strUrl = "https://dev.obtenmas.com/catom/api/challenge/banks"
        let url = URL(string: strUrl)
        let (data, _) = try! await URLSession.shared.data(from: url!)
        print(data)
        let model = try! JSONDecoder().decode([BankObject].self, from: data)
        return model
    }
    
}
