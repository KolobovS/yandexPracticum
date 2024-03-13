//
//  ViewController.swift
//  Hometask
//
//  Created by Sergey on 13.03.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private var count: Int = 0 {
        didSet {
            label.text = "Значение счётчика: \(count)"
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("UP", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Значение счётчика: 0"
        view.backgroundColor = .cyan
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setConstraints()
    }
    
    @objc func buttonTapped() {
        count += 1
    }
    
    private func setConstraints() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 80),
            label.widthAnchor.constraint(equalToConstant: 300)])
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalTo: label.heightAnchor),
            button.widthAnchor.constraint(equalTo: label.widthAnchor, multiplier: 0.3),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32),
            button.centerXAnchor.constraint(equalTo: label.centerXAnchor)])
    }
}

