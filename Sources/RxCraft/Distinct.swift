//
//  Distinct.swift
//  RxCraft
//
//  Created by Dmitry Duleba on 10/13/21.
//  Copyright © 2021 HomeMade. All rights reserved.
//

import Foundation

final class PipelineDistinct<T: Equatable>: PipelineStage<T> {

  typealias Value = T

  private var previous: Value?

  override func consume(_ value: Value) -> PipelineStageConsumptionResult {
    defer { previous = value }

    return previous == value ? .continue : .fallthrough
  }

}

public extension RxBuilder where Value: Equatable {

  func distinct() -> Self {
    insert(stage: PipelineDistinct())
    return self
  }

}
