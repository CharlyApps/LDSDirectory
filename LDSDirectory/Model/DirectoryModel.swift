//
//  DirectoryModel.swift
//  LDSDirectory
//
//  Created by Carlos Bastida on 7/5/23.
//

struct APIResponse: Codable {
    var individuals: [Individual]?
}

struct Individual: Codable, Hashable {
    var id: Int
    var firstName: String?
    var lastName: String?
    var birthdate: String?
    var profilePicture: String?
    var isForceSensitive: Bool
    var affiliation: Affiliation
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case birthdate
        case profilePicture
        case isForceSensitive = "forceSensitive"
        case affiliation = "affiliation"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        birthdate = try container.decode(String.self, forKey: .birthdate)
        profilePicture = try container.decode(String.self, forKey: .profilePicture)
        isForceSensitive = try container.decodeIfPresent(Bool.self, forKey: .isForceSensitive) ?? false
        affiliation = try container.decodeIfPresent(Affiliation.self, forKey: .affiliation) ?? .na
        id = try container.decode(Int.self, forKey: .id)
    }
}

extension Individual {
    init(entity: IndividualEntity) {
        id = Int(entity.id)
        firstName = entity.firstName
        lastName = entity.lastName
        birthdate = entity.birthdate
        profilePicture = entity.profilePicture
        isForceSensitive = entity.forceSensitive
        affiliation = Affiliation(rawValue: entity.affiliation ?? "NA") ?? .na
    }
}

enum Affiliation: String, Codable {
    case jedi = "JEDI"
    case sith = "SITH"
    case rebel = "RESISTANCE"
    case empire = "FIRST_ORDER"
    case na = "NA"
}
