import Fluent
import Vapor

func routes(_ app: Application) throws {

let ResourceController = ResourcesController()

app.post("resources", use: ResourceController.create)
// app.post("resourcee","many", use: ResourceController.createMany)

// ) { req async in
// return try req.content.decode([AppleResources].self).map({ (users) -> (HTTPStatus) in
// // process ...
// return .ok
// })
// }
// loclhost:8080/Plants GET

app.get("resources", "coding", use: ResourceController.indexCodding(req:))
app.get("resources", "design", use: ResourceController.indexDeisgn(req:))
app.get("resources", "business", use: ResourceController.indexBusiness(req:))
// loclhost:8080/Plants  GET
app.get("resources", use: ResourceController.index(req:))


// loclhost:8080/books/:id PUT
app.put("resources", use: ResourceController.update)


// loclhost:8080/books/:id DELETE
app.delete("resources", ":resourceID", use: ResourceController.delete)



try app.register(collection: ResourcesController())
}

//import Fluent
//import Vapor
//
//func routes(_ app: Application) throws {
//    app.get { req async in
//        "It works!"
//    }
//
//    app.get("hello") { req async -> String in
//        "Hello, world!"
//    }
//
//    try app.register(collection: ResourcesController())
//}

