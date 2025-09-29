//
//  FeedViewController.swift
//  Navigation
//

import UIKit

final class FeedViewController: UIViewController {

    private let model = FeedModel()

    private lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите слово"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private lazy var checkGuessButton = CustomButton(
        title: "Проверить",
        backgroundColor: .systemGreen
    ) { [weak self] in
        self?.checkWord()
    }

    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        createSubView()
    }

    private func createSubView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 300),
            stackView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant: -32)
        ])

        // старые кнопки (заменили на кастомные)
        let postButton1 = CustomButton(title: "Post number One", backgroundColor: .systemPurple) {
            self.tapPostButton()
        }
        let postButton2 = CustomButton(title: "Post number Two", backgroundColor: .systemIndigo) {
            self.tapPostButton()
        }

        stackView.addArrangedSubview(postButton1)
        stackView.addArrangedSubview(postButton2)

        // новые элементы
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(checkGuessButton)
        stackView.addArrangedSubview(resultLabel)
    }

    private func checkWord() {
        guard let input = textField.text, !input.isEmpty else {
            resultLabel.text = "Введите слово!"
            resultLabel.textColor = .gray
            return
        }

        if model.check(word: input) {
            resultLabel.text = "Верно!"
            resultLabel.textColor = .systemGreen
        } else {
            resultLabel.text = "Неверно!"
            resultLabel.textColor = .systemRed
        }
    }

    @objc func tapPostButton() {
        let post = postExamples[0]
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
}
