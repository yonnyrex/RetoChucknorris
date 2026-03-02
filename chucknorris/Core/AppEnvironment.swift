//
//  Untitled.swift
//  chucknorris
//
//  Created by Yonny on 2/03/26.
//

enum AppEnvironment {

    static var config: AppConfig {
        guard let config = AppConfigStore.shared.config else {
            fatalError("❌ AppConfig not loaded. Splash must run first.")
        }
        return config
    }

}
