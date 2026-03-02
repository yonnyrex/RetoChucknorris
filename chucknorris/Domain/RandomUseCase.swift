//
//  RandomUseCase.swift
//  chucknorris
//
//  Created by Yonny on 2/03/26.
//

protocol RandomUseCaseProtocol {
    func execute(completion: @escaping (Result<Random, Error>) -> Void)
}

struct RandomUseCase: RandomUseCaseProtocol {

    private let repository: RandomRepositoryProtocol

    init(repository: RandomRepositoryProtocol = RandomRepository()) {
        self.repository = repository
    }

    func execute(completion: @escaping (Result<Random, Error>) -> Void) {
        repository.fetchRandom(completion: completion)
    }

}
