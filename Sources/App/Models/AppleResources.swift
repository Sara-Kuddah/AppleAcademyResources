import Fluent
import Vapor

final class AppleResources: Model, Content {
    static let schema = "resources"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "pathName")
    var pathName: String
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "link")
    var link: String

    init() { }

    init(id: UUID? = nil, pathName: String, title: String, link: String) {
        self.id = id
        self.pathName = pathName
        self.title = title
        self.link = link
    }
}
