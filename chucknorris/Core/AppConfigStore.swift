//
//  AppConfigStore.swift
//  chucknorris
//
//  Created by Yonny on 2/03/26.
//

final class AppConfigStore {
    
    static let shared = AppConfigStore()
    
    private init() {}

    private(set) var config: AppConfig?

    func set(_ config: AppConfig) {
        self.config = config
    }
    
}
