//
//  Builder.swift
//  RxCraft
//
//  Created by Dmitry Duleba on 10/13/21.
//  Copyright © 2021 HomeMade. All rights reserved.
//

import Foundation

public final class RxBuilder<Value> {

  var queue: DispatchQueue?
  var block: ((Value) -> Void)?
  var onDeinit: (RxBuilder<Value>) -> Void
  var pipeline: [PipelineStage<Value>] = []

  // MARK: - Init

  init(onDeinit: @escaping (RxBuilder<Value>) -> Void) {
    self.onDeinit = onDeinit
  }

  deinit {
    onDeinit(self)
  }

  // MARK: - Public

  public func subscribe(on queue: DispatchQueue? = nil, _ block: @escaping (Value) -> Void) {
    self.queue = queue
    self.block = block
  }

  // MARK: - Internal

  func insert(stage: PipelineStage<Value>) {
    pipeline.append(stage)
  }

}
