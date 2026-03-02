//
//  APIClient.swift
//  chucknorris
//
//  Created by Yonny on 2/03/26.
//

import Alamofire

protocol APIClientProtocol {
    
    func request<T: Decodable>(_ endpoint: APIEndpoint, completion: @escaping (Result<T, Error>) -> Void)
    
}

final class APIClient: APIClientProtocol {
    
    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    
    func request<T: Decodable>(_ endpoint: APIEndpoint,
                               completion: @escaping (Result<T, Error>) -> Void) {
        
        let url = AppEnvironment.config.baseURL + endpoint.path
        
        session.request(
            url,
            method: endpoint.method,
            parameters: endpoint.parameters,
            encoding: URLEncoding.default
        )
        .validate(statusCode: 200..<300)
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let decoded):
                completion(.success(decoded))
            case .failure(let afError):
                completion(.failure(afError))
            }
        }
    }
    
}
