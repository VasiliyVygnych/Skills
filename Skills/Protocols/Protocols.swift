//
//  Protocols.swift
//  Skills
//
//  Created by Vasiliy Vygnych on 24.01.2024.
//

import UIKit

protocol ViewModelProtocol: AnyObject {
    var modelSkill: [MySkill] { get set }
    var updateView: (() -> Void)? { get set }
    var isHidde: Bool? { get set }
    var numberOfRowInSection: (_ section: Int) -> Int { get }
    var titleForRow: ((_ index: IndexPath,
                       ViewCollectionCell) -> Void) { get }
    
    func addNewSkills() -> UIAlertController
    func removeSkill(Index: Int)
}
