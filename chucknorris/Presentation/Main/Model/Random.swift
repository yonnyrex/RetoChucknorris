struct Random: Decodable {

    let iconURL: String
    let id: String
    let url: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case id
        case url
        case value
    }

}
