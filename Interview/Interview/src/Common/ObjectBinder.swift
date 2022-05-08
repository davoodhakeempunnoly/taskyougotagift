//
//  ObjectBinder.swift
//  Interview
//
//  Created by Davoodul Hakeem on 07/05/22.
//


import Foundation

class ObjectBinder<T> {
    private var listener: ((T) -> ())?

       var value: T {
           didSet { listener?(value) }
       }

       init(_ value: T) {
           self.value = value
       }

       func bind(_ listener: @escaping (T) -> Void) {
           self.listener = listener
       }
}
