//
//  FilterEventsUseCase.swift
//  Evently
//
//  Created by Hanan on 01/11/2024.
//

import Foundation

struct FilterEventsUseCase {
    @Injected var context: DbContext
    let query: String
    
    func execute() async throws -> [EventEntity] {
        let predicate = NSPredicate(format: "body CONTAINS[c] %@", query)
        let result = try await context.fetch(with: predicate, EventEntity.self)
        return Array(result)
    }

}
