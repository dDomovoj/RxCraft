//
//  Utils.swift
//
//  Created by dDomovoj on 10/13/21.
//  Copyright © 2021 HomeMade. All rights reserved.
//

import Foundation

func preconditionFailure<T>(_ message: @autoclosure () -> String = #function) -> T {
  Swift.preconditionFailure(message())
}
