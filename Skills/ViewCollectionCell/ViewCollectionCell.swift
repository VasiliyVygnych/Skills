//
//  ViewCollectionCell.swift
//  Skills
//
//  Created by Vasiliy Vygnych on 01.08.2023.
//

import UIKit

class ViewCollectionCell: UICollectionViewCell {
    
    var viewModel: ViewModelProtocol?
    
//MARK: - UILabel
    var textLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
//MARK: - UIButton
    var removeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "x.circle"),
                                  for: .normal)
        button.tintColor = .red
        return button
    }()
//MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupeView()
        setupeLadel()
        setupeButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - setupeButton
    func setupeButton() {
        removeButton.addTarget(self,
                               action: #selector(removeCell),
                               for: .touchUpInside)
    }
    @objc func removeCell(sender: UIButton) {
        viewModel?.removeSkill(Index: sender.tag)
    }
//MARK: - setupeView
    private func setupeView() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 7
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowRadius = 8
        contentView.layer.masksToBounds = false
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 4,
                                                height: 4)
        contentView.addSubview(removeButton)
        contentView.addSubview(textLabel)
    }
//MARK: - setupeLadel
    private func setupeLadel() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                       constant: 5),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                           constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                            constant: -10),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                          constant: -5),
        ])
    }
}
