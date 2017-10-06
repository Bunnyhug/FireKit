//
//  Person.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Person) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A generic person record.
 *
 *  Demographics and administrative information about a person independent of a specific health-related context.
 */
open class Person: DomainResource {
	override open class var resourceType: String {
		get { return "Person" }
	}

    public let active = RealmOptional<Bool>()
    public let address = RealmSwift.List<Address>()
    @objc public dynamic var birthDate: FHIRDate?
    @objc public dynamic var gender: String?
    public let identifier = RealmSwift.List<Identifier>()
    public let link = RealmSwift.List<PersonLink>()
    @objc public dynamic var managingOrganization: Reference?
    public func upsert(managingOrganization: Reference?) {
        upsert(prop: &self.managingOrganization, val: managingOrganization)
    }
    public let name = RealmSwift.List<HumanName>()
    @objc public dynamic var photo: Attachment?
    public func upsert(photo: Attachment?) {
        upsert(prop: &self.photo, val: photo)
    }
    public let telecom = RealmSwift.List<ContactPoint>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case active = "active"
        case address = "address"
        case birthDate = "birthDate"
        case gender = "gender"
        case identifier = "identifier"
        case link = "link"
        case managingOrganization = "managingOrganization"
        case name = "name"
        case photo = "photo"
        case telecom = "telecom"
    }
    
    public required init() {
      super.init()
    }

    public required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.active.value = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.address.append(objectsIn: try container.decodeIfPresent([Address].self, forKey: .address) ?? [])
        self.birthDate = try container.decodeIfPresent(FHIRDate.self, forKey: .birthDate)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.link.append(objectsIn: try container.decodeIfPresent([PersonLink].self, forKey: .link) ?? [])
        self.managingOrganization = try container.decodeIfPresent(Reference.self, forKey: .managingOrganization)
        self.name.append(objectsIn: try container.decodeIfPresent([HumanName].self, forKey: .name) ?? [])
        self.photo = try container.decodeIfPresent(Attachment.self, forKey: .photo)
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.active.value, forKey: .active)
        try container.encode(Array(self.address), forKey: .address)
        try container.encodeIfPresent(self.birthDate, forKey: .birthDate)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.link), forKey: .link)
        try container.encodeIfPresent(self.managingOrganization, forKey: .managingOrganization)
        try container.encode(Array(self.name), forKey: .name)
        try container.encodeIfPresent(self.photo, forKey: .photo)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Person.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Person. Will return empty instance: \(error))")
		}
		return Person.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Person else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        active.value = o.active.value

        for (index, t) in o.address.enumerated() {
            guard index < self.address.count else {
                self.address.append(t)
                continue
            }
            self.address[index].populate(from: t)
        }
    
        while self.address.count > o.address.count {
            let objectToRemove = self.address.last!
            self.address.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.birthDate, from: o.birthDate)
        gender = o.gender

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        while self.identifier.count > o.identifier.count {
            let objectToRemove = self.identifier.last!
            self.identifier.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.link.enumerated() {
            guard index < self.link.count else {
                self.link.append(t)
                continue
            }
            self.link[index].populate(from: t)
        }
    
        while self.link.count > o.link.count {
            let objectToRemove = self.link.last!
            self.link.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.managingOrganization, from: o.managingOrganization)

        for (index, t) in o.name.enumerated() {
            guard index < self.name.count else {
                self.name.append(t)
                continue
            }
            self.name[index].populate(from: t)
        }
    
        while self.name.count > o.name.count {
            let objectToRemove = self.name.last!
            self.name.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.photo, from: o.photo)

        for (index, t) in o.telecom.enumerated() {
            guard index < self.telecom.count else {
                self.telecom.append(t)
                continue
            }
            self.telecom[index].populate(from: t)
        }
    
        while self.telecom.count > o.telecom.count {
            let objectToRemove = self.telecom.last!
            self.telecom.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
    }
}


/**
 *  Link to a resource that concerns the same actual person.
 */
open class PersonLink: BackboneElement {
	override open class var resourceType: String {
		get { return "PersonLink" }
	}

    @objc public dynamic var assurance: String?
    @objc public dynamic var target: Reference?
    public func upsert(target: Reference?) {
        upsert(prop: &self.target, val: target)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(target: Reference) {
        self.init()
        self.target = target
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case assurance = "assurance"
        case target = "target"
    }
    
    public required init() {
      super.init()
    }

    public required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.assurance = try container.decodeIfPresent(String.self, forKey: .assurance)
        self.target = try container.decodeIfPresent(Reference.self, forKey: .target)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.assurance, forKey: .assurance)
        try container.encodeIfPresent(self.target, forKey: .target)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(PersonLink.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy PersonLink. Will return empty instance: \(error))")
		}
		return PersonLink.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? PersonLink else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        assurance = o.assurance
        FireKit.populate(&self.target, from: o.target)
    }
}

