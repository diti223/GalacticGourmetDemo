//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 10.06.2023.
//

import Foundation

public typealias UseCaseFetcher<Output> = UseCase<Void, Output>
public typealias UseCaseSender<Input> = UseCase<Input, Void>
public typealias UseCaseVoid = UseCase<Void, Void>

extension UseCase where Input == Void {
    
    public init(_ block: @escaping () async throws -> Output) {
        self.block = { _ in try await block() }
    }
    
    @discardableResult
    public func execute() async throws -> Output {
        try await block(Void())
    }
}

public struct UseCase<Input, Output> {
    let block: (Input) async throws -> Output
    
    public init(_ block: @escaping (Input) async throws -> Output) {
        self.block = block
    }
    
    @discardableResult
    public func execute(_ input: Input) async throws -> Output {
        try await block(input)
    }
}

extension UseCase {
    public func makeFetcher(input: Input) -> UseCaseFetcher<Output> {
        .init {
            try await execute(input)
        }
    }
}
