//
//  Usecase.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/18.
//

import Foundation

protocol Usecase<Input, Output> {
    associatedtype Input
    associatedtype Output
    
    func execute(_ input: Input) async throws -> Output
}
