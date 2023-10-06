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
        layout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
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
    private var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Бла Бла Бла Бла Бла Бла Бла Бла."
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
        label.text = "Бла Бла Бла Бла Бла Бла Бла Бла Бла Бла Бла Бла Бла Бла"
        label.numberOfLines = 2
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
    private var settingButton: UIBarButtonItem = {
       let button = UIBarButtonItem()
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
        setupscrollkView()
        cetupeContentView()
        setupeImage()
        setupelabel()
        setupeButton()
        setupecollectionView()
        setupeBarButtonItem()
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
        firstView.addSubview(imageView)
        firstView.addSubview(nameLabel)
        firstView.addSubview(titleLabel)
        firstView.addSubview(secondView)
        secondView.addSubview(infoLabel)
        secondView.addSubview(addSkillsButton)
        secondView.addSubview(aboutLabel)
        secondView.addSubview(aboutInfoLabel)
        secondView.addSubview(collectionView)
        
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
            nameLabel.topAnchor.constraint(equalTo: firstView.topAnchor,
                                            constant: 180),
            nameLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,
                                                       constant: 100),
            nameLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,
                                                        constant: -100),
//MARK: - titleLabel
            titleLabel.topAnchor.constraint(equalTo: firstView.topAnchor,
                                            constant: 260),
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
                                               constant: -40),
//MARK: - aboutInfoLabel
            aboutInfoLabel.topAnchor.constraint(equalTo: aboutLabel.topAnchor,
                                                constant: 10),
            aboutInfoLabel.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            aboutInfoLabel.leadingAnchor.constraint(equalTo: secondView.leadingAnchor,
                                                    constant: 10),
            aboutInfoLabel.trailingAnchor.constraint(equalTo: secondView.trailingAnchor,
                                                     constant: -5),
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
        addSkillsButton.addTarget(self, action: #selector(addSkills),
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
                                                        constant: -60)
        ])
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ViewCollectionCell.self,
                                forCellWithReuseIdentifier: viewCell)
    }   
//MARK: - setupeBarButtonItem
    private func setupeBarButtonItem(){
        settingButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"),
                                                          style: .plain,
                                                          target: self,
                                                          action: #selector(setting))
        settingButton.tintColor = .black
        navigationItem.rightBarButtonItem = settingButton
    }
//MARK: - setupeGestures
    private func setupeGestures() {
        let tapGestures =  UITapGestureRecognizer(target: self,
                                                  action: #selector(setting))
        tapGestures.numberOfTapsRequired = 1
        settingButton.customView?.addGestureRecognizer(tapGestures)
    }
//MARK: - setting profile button
    @objc func setting() {
        let popVC = TableViewController()
        popVC.modalPresentationStyle = .popover
        let popoverVC = popVC.popoverPresentationController
        popoverVC?.delegate = self
        popoverVC?.sourceItem = self.settingButton
        popoverVC?.sourceRect = CGRect(x: settingButton.customView?.bounds.midX ?? 0,
                                       y: CGFloat(settingButton.customView?.bounds.midY ?? 0),
                                       width: CGFloat(0),
                                       height: CGFloat(0))
        popVC.preferredContentSize = CGSize(width: 250,
                                            height: 250)
        self.present(popVC,
                     animated: true)
    }
    
    
    
    
    
    
    
    
    
//MARK: - setupeButtonCell
    func setupeButtonCell() -> UIButton {
        let cellButton = UIButton()
        cellButton.translatesAutoresizingMaskIntoConstraints = false
        cellButton.addTarget(self,
                                action: #selector(removeSkillCell),
                                for: .touchUpInside)
        cellButton.setBackgroundImage(UIImage(systemName: "x.circle"), for: .normal)
        cellButton.tintColor = .red
        return cellButton
    }
//MARK: - removeCellSkill
        @objc func removeSkillCell(_ sender: UIButton) {
            viewModel.removeSkill(Index: sender.tag)
        }
//MARK: - button addSkills
    @objc private func addSkills(_ sender: UIButton) {
//        isHiddenButtonCell(sender)
        if addSkillsButton.currentBackgroundImage == UIImage(systemName: "plus.square") {
            addSkillsButton.setBackgroundImage(UIImage(systemName: "checkmark.circle.fill"),
                                               for: .normal)
            let alert = viewModel.addNewSkills()
                navigationController?.present(alert,
                                           animated: true)
            infoLabel.text = "Редактирование навыков:"
        } else {
            addSkillsButton.setBackgroundImage(UIImage(systemName: "plus.square"),
                                               for: .normal)
            infoLabel.text = "Мои навыки:"
            collectionView.reloadData()
        }
    }
    

//    func isHiddenButtonCell(_ sender: UIButton) {
//        sender.tag += 1
//        switch sender.tag {
//        case 1 : if sender.tag == 1 {
//            SaveValue.isHidden = false
//            print(sender.tag)
//        }
//        case 2 : if sender.tag == 2 {
//            SaveValue.isHidden = true
////            sender.tag = 0
//            print(sender.tag)
//        }
//        default:
////            break
//            sender.tag = 0
//        }
//    }

    
    
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
        let buttonCell = setupeButtonCell()
        cell.skillsView.addSubview(buttonCell)
        buttonCell.isHidden = SaveValue.isHidden
        viewModel.titleForRow(indexPath,
                              cell)
        return cell
    }
}
//MARK: - CollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let infoSkill = viewModel.infoSkill(at: indexPath)
//            navigationController?.present(infoSkill,
//                                       animated: true)
    }
}
//MARK: - PopoverPresentationControllerDelegate
extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
