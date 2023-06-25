//
//  Point.swift
//  Lesson 1
//
//  Created by Егор  Хлямов on 25.06.2023.
//

import Foundation
import RealmSwift

class Point: Object {
  @objc dynamic var latitude = 0.0
  @objc dynamic var longitude = 0.0
}
