//
//  CustomButton.swift
//  Navigation
//

import UIKit

final class CustomButton: UIButton {

    private var action: (() -> Void)?

    init(title: String,
         titleColor: UIColor = .white,
         backgroundColor: UIColor = .systemBlue,
         action: (() -> Void)? = nil) {
        super.init(frame: .zero)

        self.action = action
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 10
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        translatesAutoresizingMaskIntoConstraints = false
    }

    @objc private func buttonTapped() {
        action?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

