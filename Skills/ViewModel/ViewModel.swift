//
//  ViewModel.swift
//  Skills
//
//  Created by Vasiliy Vygnych  on 01.08.2023.
//

import UIKit

final class ViewModel: ViewModelProtocol {
//MARK: - properties
    var modelSkill: [MySkill] = []
    var updateView: (() -> Void)?
    var isHidde: Bool?
    
    lazy var numberOfRowInSection: (Int) -> Int = getNumberOfRowInSection
    lazy var titleForRow: ((IndexPath,
                            ViewCollectionCell) -> Void) = getTitleForRow
    
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
    }
}
