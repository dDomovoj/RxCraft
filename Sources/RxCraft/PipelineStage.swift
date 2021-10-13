//
//  PipelineStage.swift
//  RxCraft
//
//  Created by Dmitry Duleba on 10/13/21.
//  Copyright © 2021 HomeMade. All rights reserved.
//

import Foundation

enum PipelineStageConsumptionResult {
  case `fallthrough`
  case `continue`
  case `break`
}

protocol IPipelineStage {

  associatedtype Value

  var isFinished: Bool { get }

  func consume(_ value: Value) -> PipelineStageConsumptionResult

}

class PipelineStage<T>: IPipelineStage {

  typealias Value = T

  var isFinished: Bool = false

  func consume(_ value: T) -> PipelineStageConsumptionResult { preconditionFailure("Abstract method") }

}
