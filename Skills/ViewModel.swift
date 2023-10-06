//
//  ViewModel.swift
//  Skills
//
//  Created by Vasiliy Vygnych  on 01.08.2023.
//

import UIKit

enum UserDefaultsKey {
    static var saveSkill = "skill"
}

protocol ViewModelProtocol: AnyObject {
    var modelSkill: [MySkill] { get set }
    func addNewSkills() -> UIAlertController
    func removeSkill(Index: Int)
    var updateView: (() -> Void)? { get set }
    var numberOfRowInSection: (_ section: Int) -> Int { get }
    var titleForRow: ((_ index: IndexPath, ViewCollectionCell) -> Void) { get }
//    func infoSkill(at indexPath: IndexPath) -> UIAlertController
    var button: () -> UIButton { get }
//    func isHiddenButtonCell(_ index: Int)
}

final class ViewModel: ViewModelProtocol {
//MARK: - properties
    var modelSkill: [MySkill] = []
    var updateView: (() -> Void)?
    lazy var numberOfRowInSection: (Int) -> Int = getNumberOfRowInSection
    lazy var titleForRow: ((IndexPath, ViewCollectionCell) -> Void) = getTitleForRow
    lazy var button: () -> UIButton = setupeButtonCell
//MARK: - infoSkill
//    func infoSkill(at indexPath: IndexPath) -> UIAlertController {
//        let skillList = modelSkill[indexPath.row]
//        let alert = UIAlertController(title: "\(skillList.skill)",
//                                      message: "\(skillList.skill)",
//                                      preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "Ok",
//                                         style: .default)
//        alert.addAction(cancelAction)
//        return alert
//
//    }
//MARK: - addNewSkills
    func addNewSkills() -> UIAlertController {
        let alert = UIAlertController(title: "Добавление навыка",
                                      message: "Введите название навыка, которым вы владеете",
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена",
                                         style: .default)
        let action = UIAlertAction(title: "Добавить",
                                   style: .default) { (action) in
            guard let skill = alert.textFields?.first?.text else { return }
            self.addSkill(skill: skill)
        }
        alert.addTextField { nameSkill in
            nameSkill.placeholder = "Название навыка"
        }
        alert.addAction(cancelAction)
        alert.addAction(action)
        return alert
    }
//MARK: - addSkill
    func addSkill(skill: String) {
        let newSkill = MySkill(skill: skill)
        modelSkill.append(newSkill)
        updateView?()
    }
//MARK: - removeSkill
    func removeSkill(Index: Int) {
        modelSkill.remove(at: Index)
        updateView?()
    }
//MARK: - getNumberOfRowInSection
    private func getNumberOfRowInSection(_ section: Int) -> Int {
        let section = modelSkill.count
        return section
    }
//MARK: - getTitleForRow
    private func getTitleForRow(at indexPath: IndexPath,
                                cell: ViewCollectionCell) {
        let skill = modelSkill[indexPath.row]
            cell.textLabel.text = skill.skill
        
        
        
        
        saveMySkill()
        getMySkill(at: indexPath, cell: cell)
    }
 
    
    
    
    
    
    
//MARK: - setupeButtonCell
    func setupeButtonCell() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false 
        button.addTarget(self,
                         action: #selector(removeSkillCell),
                         for: .touchUpInside)
        button.setImage(UIImage(systemName: "x.circle"),
                                for: .normal)
        button.tintColor = .red
        return button
    }
//MARK: - removeSkillCell
    @objc func removeSkillCell(_ sender: UIButton) {
        removeSkill(Index: sender.tag)
    }
    

    
    
    
    
    
    
    
    
    func saveMySkill() {
        let skill = modelSkill
        let mySkill = skill.map{ $0.skill }
        UserDefaults.standard.set(mySkill, forKey: SaveValue.mySkills)
    }
    
    func getMySkill(at indexPath: IndexPath, cell: ViewCollectionCell) {
        if let save = UserDefaults.standard.stringArray(forKey: SaveValue.mySkills) {
            let model = save[indexPath.item]
            print("getMySkill- \(model)")
        }
    }
    
}
