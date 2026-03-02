//
//  MainVC.swift
//  chucknorris
//
//  Created by Yonny on 2/03/26.
//

import UIKit

final class MainVC: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var fetchButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties

    private let viewModel = MainViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.fetchJoke()
    }

    // MARK: - Bindings

    private func bindViewModel() {
        viewModel.onLoading = { [weak self] isLoading in
            isLoading ? self?.activityIndicator.startAnimating() : self?.activityIndicator.stopAnimating()
            self?.fetchButton.isEnabled = !isLoading
        }

        viewModel.onJokeLoaded = { [weak self] joke, iconURL in
            self?.jokeLabel.text = joke
            self?.loadAvatar(from: iconURL)
        }

        viewModel.onError = { [weak self] message in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(alert, animated: true)
        }
    }

    private func loadAvatar(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.avatarImageView.image = image
            }
        }.resume()
    }

    // MARK: - IBActions

    @IBAction func fetchTapped(_ sender: UIButton) {
        viewModel.fetchJoke()
    }

}
