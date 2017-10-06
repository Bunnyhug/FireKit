//
//  HumanName.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/HumanName) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Name of a human - parts and usage.
 *
 *  A human's name with the ability to identify parts and usage.
 */
open class HumanName: Element {
	override open class var resourceType: String {
		get { return "HumanName" }
	}

    public let family = RealmSwift.List<RealmString>()
    public let given = RealmSwift.List<RealmString>()
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let prefix = RealmSwift.List<RealmString>()
    public let suffix = RealmSwift.List<RealmString>()
    @objc public dynamic var text: String?
    @objc public dynamic var use: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case family = "family"
        case given = "given"
        case period = "period"
        case prefix = "prefix"
        case suffix = "suffix"
        case text = "text"
        case use = "use"
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

        self.family.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .family) ?? [])
        self.given.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .given) ?? [])
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.prefix.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .prefix) ?? [])
        self.suffix.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .suffix) ?? [])
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.use = try container.decodeIfPresent(String.self, forKey: .use)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.family), forKey: .family)
        try container.encode(Array(self.given), forKey: .given)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encode(Array(self.prefix), forKey: .prefix)
        try container.encode(Array(self.suffix), forKey: .suffix)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.use, forKey: .use)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(HumanName.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy HumanName. Will return empty instance: \(error))")
		}
		return HumanName.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? HumanName else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.family.enumerated() {
            guard index < self.family.count else {
                self.family.append(t)
                continue
            }
            self.family[index].populate(from: t)
        }
    
        while self.family.count > o.family.count {
            let objectToRemove = self.family.last!
            self.family.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.given.enumerated() {
            guard index < self.given.count else {
                self.given.append(t)
                continue
            }
            self.given[index].populate(from: t)
        }
    
        while self.given.count > o.given.count {
            let objectToRemove = self.given.last!
            self.given.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.period, from: o.period)

        for (index, t) in o.prefix.enumerated() {
            guard index < self.prefix.count else {
                self.prefix.append(t)
                continue
            }
            self.prefix[index].populate(from: t)
        }
    
        while self.prefix.count > o.prefix.count {
            let objectToRemove = self.prefix.last!
            self.prefix.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.suffix.enumerated() {
            guard index < self.suffix.count else {
                self.suffix.append(t)
                continue
            }
            self.suffix[index].populate(from: t)
        }
    
        while self.suffix.count > o.suffix.count {
            let objectToRemove = self.suffix.last!
            self.suffix.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        text = o.text
        use = o.use
    }
}

