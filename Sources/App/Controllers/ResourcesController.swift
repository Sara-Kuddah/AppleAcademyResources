import Fluent
import Vapor

struct ResourcesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let resources = routes.grouped("resources")
        resources.get(use: index)
        resources.post(use: create)
        resources.group(":resourceID") { resource in
            resource.delete(use: delete)
        }
    }
    
    func indexCodding (req: Request) async throws -> [AppleResources] {
        let resources = try await AppleResources.query(on: req.db)
            .filter(\.$pathName == "Coding").all()
        //print("resources \(resources)")
        return resources
        
    }

    func indexDeisgn (req: Request) async throws -> [AppleResources] {
        let resources = try await AppleResources.query(on: req.db)
            .filter(\.$pathName == "Deisgn").all()
        //print("resources \(resources)")
        return resources
        
    }

    func indexBusiness (req: Request) async throws -> [AppleResources] {
        let resources = try await AppleResources.query(on: req.db)
            .filter(\.$pathName == "Business").all()
        //print("resources \(resources)")
        return resources
        
    }

    func index(req: Request) async throws -> [AppleResources] {
        try await AppleResources.query(on: req.db).all()
    }

    func create(req: Request) async throws -> AppleResources {
        let resource = try req.content.decode(AppleResources.self)
        try await resource.save(on: req.db)
        return resource
    }
    // func createMany (req: Request) async throws -> [AppleResources] {
    // let test = try req.content.decode([AppleResources].self)
    // return try await test.map({ (resource) in
    // print("resource (resource)")
    // resource.save(on: req.db)
    // return resource
    // })
    // // return test
    //// .forEach({ (resource) -> in
    //// // process ...
    //// print("fffff")
    ////// try await resource.save(on: req.db)
    ////
    //// })
    //
    // }
    func update(req:Request) throws -> EventLoopFuture<HTTPStatus> {
        
        let Resources = try req.content.decode(AppleResources.self)
    // print("Resources (Resources)")
    // print("Resources (String(describing: Resources.id))")

        return AppleResources.find(Resources.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.pathName = Resources.pathName
                $0.title = Resources.title
                $0.link = Resources.link
                return $0.update(on: req.db).transform(to: .ok)
            }
        
    }



    func delete (req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return AppleResources.find(req.parameters.get ("resourceID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform (to: .ok)
    }
    }
