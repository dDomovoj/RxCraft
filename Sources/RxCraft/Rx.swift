//
//  Rx.swift
//  RxCraft
//
//  Created by Dmitry Duleba on 10/13/21.
//  Copyright © 2021 HomeMade. All rights reserved.
//

import Foundation

final class Rx<Value> {

  private let queue: DispatchQueue?
  private let callback: (Value) -> Void

  private var pipeline: [PipelineStage<Value>]

  // MARK: - Init

  init?(_ builder: RxBuilder<Value>, value: Value) {
    guard let callback = builder.block else { return nil }

    pipeline = builder.pipeline()
    self.queue = builder.queue
    self.callback = callback

    if consume(value) { return nil }
  }

  deinit {
    debugLog(self)
  }

  /// returns true if sequence is finished
  func consume(_ value: Value) -> Bool {
    var didFinish = false
    for elt in pipeline {
      let result = elt.consume(value)

      if elt.isFinished {
        didFinish = true
      }

      switch result {
      case .break: return true
      case .continue: return didFinish
      case .fallthrough: break
      }
    }

    if let queue = queue {
      queue.async { [weak self] in self?.callback(value) }
    } else {
      callback(value)
    }
    return didFinish
  }

}
