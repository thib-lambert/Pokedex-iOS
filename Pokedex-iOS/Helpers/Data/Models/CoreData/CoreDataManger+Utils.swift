//
//  CoreDataManger+Utils.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 14/03/2021.
//

import PromiseKit

extension CoreDataManager {
    func savePromise(in queue: DispatchQueue = .main) -> Promise<Void> {
        Promise { resolver in
            queue.async {
                do {
                    try self.save()
                    resolver.fulfill(())
                } catch {
                    resolver.reject(error)
                }
            }
        }
    }
}
