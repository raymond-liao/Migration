//
//  Array+Only.swift
//  Migration
//
//  Created by raniys on 6/17/20.
//  Copyright © 2020 raniys. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? { count == 1 ? first : nil }
}
