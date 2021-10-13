//
//  Filter.swift
//  RxCraft
//
//  Created by Dmitry Duleba on 10/13/21.
//  Copyright © 2021 HomeMade. All rights reserved.
//

import Foundation

final class PipelineFilter<T>: PipelineStage<T> {

  typealias Value = T

  private let filter: (Value) -> Bool

  init(_ block: @escaping (Value) -> Bool) {
    filter = block
  }

  override func consume(_ value: Value) -> PipelineStageConsumptionResult {
    filter(value) ? .fallthrough : .continue
  }

}

public extension RxBuilder {

  func filter(_ block: @escaping (Value) -> Bool) -> Self {
    insert(stage: PipelineFilter(block))
    return self
  }

}
