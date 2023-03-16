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

    func index(req: Request) async throws -> [AppleResources] {
        try await AppleResources.query(on: req.db).all()
    }

    func create(req: Request) async throws -> AppleResources {
        let resource = try req.content.decode(AppleResources.self)
        try await resource.save(on: req.db)
        return resource
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let resource = try await AppleResources.find(req.parameters.get("resourceID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await resource.delete(on: req.db)
        return .noContent
    }
}
