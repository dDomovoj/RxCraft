//
//  Skip.swift
//  RxCraft
//
//  Created by Dmitry Duleba on 10/13/21.
//  Copyright © 2021 HomeMade. All rights reserved.
//

final class PipelineSkip<T>: PipelineStage<T> {

  private var count: Int

  init(_ count: Int) {
    self.count = count
  }

  override func consume(_ value: T) -> PipelineStageConsumptionResult {
    if count > 0 {
      count -= 1
      return .continue
    }
    return .fallthrough
  }

}

public extension RxBuilder {

  func skip(_ count: Int) -> Self {
    insert(stage: PipelineSkip(count))
    return self
  }

}
