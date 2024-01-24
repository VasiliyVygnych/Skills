//
//  ViewController.swift
//  Skills
//
//  Created by Vasiliy Vygnych on 01.08.2023.

import UIKit

class ViewController: UIViewController {
//MARK: - properties
    private let viewModel: ViewModelProtocol = ViewModel()
    private var viewCell = "viewCell"
    
//MARK: - scrollkView
    private var scrollkView: UIScrollView = {
        let scrollkView = UIScrollView()
        scrollkView.translatesAutoresizingMaskIntoConstraints = false
        scrollkView.showsVerticalScrollIndicator = true
        scrollkView.alwaysBounceVertical = true
        scrollkView.backgroundColor = .white
        return scrollkView
    }()
//MARK: - contrentView
    private var firstView: UIView = {
       let UIview = UIView()
        UIview.translatesAutoresizingMaskIntoConstraints = false
        UIview.backgroundColor = .white
        return UIview
    }()
    private var secondView: UIView = {
       let UIview = UIView()
        UIview.translatesAutoresizingMaskIntoConstraints = false
        UIview.backgroundColor = .white
        UIview.layer.cornerRadius = 7
        UIview.layer.shadowOpacity = 0.4
        UIview.layer.shadowRadius = 8
        UIview.layer.masksToBounds = false
        UIview.layer.shadowColor = UIColor.black.cgColor
        UIview.layer.shadowOffset = CGSize(width: 4,
                                           height: 4)
        return UIview
    }()
//MARK: - collectionView & FlowLayout
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 10,
                                    left: 10,
                                    bottom: 10,
                                    right: 10)
        return layout
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.contentMode = .scaleAspectFit
        return collectionView
    }()
//MARK: - iomage
    private var imageView: UIImageView = {
       let image = UIImageView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 150,
                                             height: 150))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        image.image = UIImage(named: "myPhoto")
        return image
    }()
//MARK: - labels
    private var nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15,
                                 weight: .bold)
        label.text = "Выгныч Василий Юрьевич"
        label.numberOfLines = 0
        return label
    }()
    private var skillLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13,
                                 weight: .regular)
        label.text = "iOS - Разработчик"
        label.numberOfLines = 0
        return label
    }()
    private var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Опыт разработки 1 год. г. Москва"
        label.font = .systemFont(ofSize: 11,
                                 weight: .semibold)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    private var infoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13,
                                 weight: .semibold)
        label.text = "Мои навыки:"
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    private var aboutLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13,
                                 weight: .semibold)
        label.text = "O себе"
        label.textAlignment = .left
        return label
    }()
    private var aboutInfoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 11,
                                 weight: .semibold)
        label.text = "В свободное от работы время люблю проводить время с семьей, друзьям. Люблю активный отдых и путешествия. Хожу в спортивный зал."
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
//MARK: - button
    private var addSkillsButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.setBackgroundImage(UIImage(systemName: "plus.square"), for: .normal)
        return button
    }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Профиль"
        view.addSubview(scrollkView)
        viewModel.updateView = { [ weak self ] in
            self?.collectionView.reloadData()
        }
        setupeViews()
        setupscrollkView()
        cetupeContentView()
        setupeImage()
        setupelabel()
        setupeButton()
        setupecollectionView()
    }
//MARK: - setupeViews
    private func setupeViews() {
        firstView.addSubview(imageView)
        firstView.addSubview(nameLabel)
        firstView.addSubview(skillLabel)
        firstView.addSubview(titleLabel)
        firstView.addSubview(secondView)
        secondView.addSubview(infoLabel)
        secondView.addSubview(addSkillsButton)
        secondView.addSubview(aboutLabel)
        secondView.addSubview(aboutInfoLabel)
        secondView.addSubview(collectionView)
    }
//MARK: - setupscrollkView
    private func setupscrollkView() {
        scrollkView.addSubview(firstView)
        NSLayoutConstraint.activate([
            scrollkView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollkView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollkView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollkView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
//MARK: - cetupecontentView
    private func cetupeContentView() {
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: scrollkView.topAnchor),
            firstView.leadingAnchor.constraint(equalTo: scrollkView.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: scrollkView.trailingAnchor),
            firstView.widthAnchor.constraint(equalTo: scrollkView.widthAnchor),
            firstView.bottomAnchor.constraint(equalTo: scrollkView.bottomAnchor),
//MARK: - secondView
            secondView.topAnchor.constraint(equalTo: titleLabel.topAnchor,
                                                   constant: 50),
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,
                                                       constant: 20),
            secondView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,
                                                        constant: -20),
            secondView.heightAnchor.constraint(equalToConstant: 400),
            secondView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor,
                                               constant: -20)
        ])
    }
//MARK: - setupeImage
    private func setupeImage() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: firstView.topAnchor,
                                           constant: 20),
            imageView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,
                                               constant: 120),
            imageView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,
                                             constant: -120),
            imageView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor,
                                              constant: -550)
        ])
    }
//MARK: - setupelabel
    private func setupelabel() {
        NSLayoutConstraint.activate([
//MARK: - nameLabel
            nameLabel.topAnchor.constraint(equalTo: firstView.topAnchor,
                                            constant: 180),
            nameLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,
                                                       constant: 100),
            nameLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,
                                                        constant: -100),
//MARK: - skillLabel
            skillLabel.topAnchor.constraint(equalTo: firstView.topAnchor,
                                            constant: 220),
            skillLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            skillLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,
                                                       constant: 100),
            skillLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,
                                                        constant: -100),
//MARK: - titleLabel
            titleLabel.topAnchor.constraint(equalTo: firstView.topAnchor,
                                            constant: 250),
            titleLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,
                                                       constant: 100),
            titleLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,
                                                        constant: -100),
//MARK: - infoLabel
            infoLabel.topAnchor.constraint(equalTo: secondView.topAnchor,
                                           constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: secondView.leadingAnchor,
                                                constant: 10),
//MARK: - aboutLabel
            aboutLabel.leadingAnchor.constraint(equalTo: secondView.leadingAnchor,
                                                constant: 10),
            aboutLabel.bottomAnchor.constraint(equalTo: secondView.bottomAnchor,
                                               constant: -80),
//MARK: - aboutInfoLabel
            aboutInfoLabel.topAnchor.constraint(equalTo: aboutLabel.topAnchor,
                                                constant: -20),
            aboutInfoLabel.leadingAnchor.constraint(equalTo: secondView.leadingAnchor,
                                                    constant: 10),
            aboutInfoLabel.trailingAnchor.constraint(equalTo: secondView.trailingAnchor,
                                                     constant: -10),
            aboutInfoLabel.bottomAnchor.constraint(equalTo: secondView.bottomAnchor,
                                                   constant: -5)
        ])
    }
//MARK: - setupeButton
    private func setupeButton() {
        NSLayoutConstraint.activate([
        addSkillsButton.topAnchor.constraint(equalTo: secondView.topAnchor,
                                             constant: 10),
        addSkillsButton.leadingAnchor.constraint(equalTo: secondView.leadingAnchor,
                                                 constant: 310),
        ])
        addSkillsButton.addTarget(self,
                                  action: #selector(addSkills),
                                  for: .touchUpInside)
    }
//MARK: - setupecollectionView
    func setupecollectionView() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: secondView.safeAreaLayoutGuide.topAnchor,
                                                     constant: 30),
            self.collectionView.leadingAnchor.constraint(equalTo: secondView.safeAreaLayoutGuide.leadingAnchor,
                                                         constant: 10),
            self.collectionView.trailingAnchor.constraint(equalTo: secondView.safeAreaLayoutGuide.trailingAnchor,
                                                          constant: -10),
            self.collectionView.bottomAnchor.constraint(equalTo: secondView.safeAreaLayoutGuide.bottomAnchor,
                                                        constant: -100)
        ])
        collectionView.dataSource = self
        collectionView.register(ViewCollectionCell.self,
                                forCellWithReuseIdentifier: viewCell)
    }
//MARK: - button addSkills
    @objc private func addSkills(sender: UIButton) {
        if addSkillsButton.currentBackgroundImage == UIImage(systemName: "plus.square") {
            addSkillsButton.setBackgroundImage(UIImage(systemName: "checkmark.circle.fill"),
                                               for: .normal)
            let alert = viewModel.addNewSkills()
                navigationController?.present(alert,
                                           animated: true)
            infoLabel.text = "Редактирование"
            viewModel.isHidde = false
        } else {
            addSkillsButton.setBackgroundImage(UIImage(systemName: "plus.square"),
                                               for: .normal)
            viewModel.isHidde = true
            infoLabel.text = "Мои навыки:"
            collectionView.reloadData()
        }
    }
}
//MARK: - CollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection(section)
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewCell,
                                                      for: indexPath) as! ViewCollectionCell
        cell.removeButton.tag = indexPath.item
        cell.viewModel = viewModel
        viewModel.titleForRow(indexPath,
                              cell)
        if viewModel.isHidde == true {
            cell.removeButton.isHidden = true
        } else {
            cell.removeButton.isHidden = false
        }
        return cell
    }
}
