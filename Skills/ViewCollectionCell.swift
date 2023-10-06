//
//  ViewCollectionCell.swift
//  Skills
//
//  Created by Vasiliy Vygnych on 01.08.2023.
//

import UIKit

class ViewCollectionCell: UICollectionViewCell {
//MARK: - properties
    private let viewModel: ViewModelProtocol = ViewModel()
//MARK: - textLabel
    var textLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    var skillsView: UIView = {
       let UIView = UIView()
        UIView.translatesAutoresizingMaskIntoConstraints = false
        UIView.backgroundColor = .white
        UIView.layer.cornerRadius = 7
        UIView.layer.shadowOpacity = 0.4
        UIView.layer.shadowRadius = 8
        UIView.layer.masksToBounds = false
        UIView.layer.shadowColor = UIColor.black.cgColor
        UIView.layer.shadowOffset = CGSize(width: 4,
                                           height: 4)
        return UIView
    }()
//MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupskillsView()
        setupeLadel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - setupconteinerView
    private func setupskillsView() {
        addSubview(skillsView)
        skillsView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            skillsView.topAnchor.constraint(equalTo: self.topAnchor,
                                               constant: 5),
            skillsView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                               constant: 5),
        
            skillsView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                constant: -5),
        ])
    }
    private func setupeLadel() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: skillsView.topAnchor,
                                       constant: 5),
            textLabel.leadingAnchor.constraint(equalTo: skillsView.leadingAnchor,
                                           constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: skillsView.trailingAnchor,
                                            constant: -10),
            textLabel.bottomAnchor.constraint(equalTo: skillsView.bottomAnchor,
                                          constant: -5),
        ])
    }
}
