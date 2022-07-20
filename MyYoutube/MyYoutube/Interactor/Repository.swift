//
//  Repository.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/18.
//

import Foundation

protocol Repository<Input, Output> {
    associatedtype Input
    associatedtype Output
    
    func fetch(_ input: Input) async throws -> Output
}

