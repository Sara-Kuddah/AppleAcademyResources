import Fluent

struct CreateResources: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("resources")
            .id()
            .field("pathName", .string, .required)
            .field("title", .string, .required)
            .field("link", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("resources").delete()
    }
}
