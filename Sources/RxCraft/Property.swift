//
//  Property.swift
//  RxCraft
//
//  Created by Dmitry Duleba on 10/13/21.
//  Copyright © 2021 HomeMade. All rights reserved.
//

import Foundation

@propertyWrapper
public final class Property<T> {

  public typealias Value = T
  public typealias OnChange = (Value) -> Void

  public var wrappedValue: Value { didSet { didChange() } }
  public var projectedValue: RxBuilder<T> {
    .init { [weak self] builder in
      guard let self = self else { return }

      if let observable = Rx(builder, value: self.wrappedValue) {
        self.observables.append(observable)
      }
    }
  }

  private var observables = [Rx<T>]()

  // MARK: - Init

  public init(wrappedValue: Value) {
    self.wrappedValue = wrappedValue
  }

}

// MARK: - Private

private extension Property {

  func didChange() {
    observables.removeAll { $0.consume(wrappedValue) }
  }

}
