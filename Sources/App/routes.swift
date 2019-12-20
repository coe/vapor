import Vapor
import Foundation

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    let number:NSNumber = 100_000_000
    let string = NumberFormatter.localizedString(from: number, number: .spellOut)
    print("hyuu numberFormatter:\(String(describing: numberFormatter.locale))")
    print("hyuu string:\(string)")
    

    let progress = NSProgress()
    progress.totalUnitCount = 5_312_764
    progress.completedUnitCount = 419_240
    print("hyuu progress localizedDescription:\(String(describing: progress.localizedDescription))")
    print("hyuu progress localizedAdditionalDescription:\(String(describing: progress.localizedAdditionalDescription))")

    let numberFormatter2 = NumberFormatter()
    numberFormatter2.numberStyle = .none
    
    router.get { req in
        return string
    }


    
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return String(describing: progress.localizedDescription)
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
