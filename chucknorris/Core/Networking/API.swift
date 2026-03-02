//
//  API.swift
//  chucknorris
//
//  Created by Yonny on 2/03/26.
//

import Alamofire

protocol APIEndpoint {

    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    
}

enum ChicknorrisAPI: APIEndpoint {
    
    case fetchRandom
    
    var path: String {
        switch self  {
        case .fetchRandom: return "/jokes/random"
        }
    }
    
    var method: HTTPMethod { .get }

    var parameters: Parameters? {
        return nil
    }
    
}
