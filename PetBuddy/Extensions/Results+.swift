//
//  Results+.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 10/08/2023.
//

import Foundation
import RealmSwift

extension Results {
    func toArray() -> [Element] {
      return compactMap {
        $0
      }
    }
 }
