//
//  Take.swift
//  RxCraft
//
//  Created by Dmitry Duleba on 10/13/21.
//  Copyright © 2021 HomeMade. All rights reserved.
//

import Foundation

final class PipelineTake<T>: PipelineStage<T> {

  private var count: Int

  init(_ count: Int) {
    self.count = count
  }

  override func consume(_ value: T) -> PipelineStageConsumptionResult {
    defer { isFinished = count <= 0 }

    if count <= 0 {
      return .break
    }

    count -= 1
    return .fallthrough
  }

}

public extension RxBuilder {

  func take(_ count: Int) -> Self {
    insert(stage: PipelineTake(count))
    return self
  }

}
