import Vapor
import Foundation

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    let number:NSNumber = 100_000_000
    let string = NumberFormatter.localizedString(from: number, number: .spellOut)
    print("hyuu numberFormatter:\(numberFormatter.locale)")
    print("hyuu string:\(string)")
    let url = URLCache.init()
    
    // Basic "Hello, world!" example
    router.get("hello") { req in

        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
