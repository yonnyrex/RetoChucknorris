//
//  MainViewModel.swift
//  chucknorris
//
//  Created by Yonny on 2/03/26.
//

import Foundation

final class MainViewModel {

    private let useCase: RandomUseCaseProtocol

    var onJokeLoaded: ((String, String) -> Void)?
    var onError: ((String) -> Void)?
    var onLoading: ((Bool) -> Void)?

    init(useCase: RandomUseCaseProtocol = RandomUseCase()) {
        self.useCase = useCase
    }

    func fetchJoke() {
        onLoading?(true)
        useCase.execute { [weak self] result in
            DispatchQueue.main.async {
                self?.onLoading?(false)
                switch result {
                case .success(let response):
                    self?.onJokeLoaded?(response.value, response.iconURL)
                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }

}
