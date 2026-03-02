//
//  RandomRepository.swift
//  chucknorris
//
//  Created by Yonny on 2/03/26.
//

protocol RandomRepositoryProtocol {
    func fetchRandom(completion: @escaping (Result<Random, Error>) -> Void)
}

final class RandomRepository: RandomRepositoryProtocol {

    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchRandom(completion: @escaping (Result<Random, Error>) -> Void) {
        apiClient.request(ChicknorrisAPI.fetchRandom, completion: completion)
    }

}
