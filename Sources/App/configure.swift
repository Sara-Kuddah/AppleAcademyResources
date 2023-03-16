import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(
        .postgres(hostname: "localhost",
                  port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
                 username: "sarah",
                 password: "",
                 database: "appleacademyresources"),
        as: .psql)

    app.migrations.add(CreateResources())

    // register routes
    try routes(app)
}
