//
//  Reference.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Reference) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A reference from one resource to another.
 */
open class Reference: Element {
	override open class var resourceType: String {
		get { return "Reference" }
	}

    @objc public dynamic var display: String?
    @objc public dynamic var reference: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case display = "display"
        case reference = "reference"
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

        self.display = try container.decodeIfPresent(String.self, forKey: .display)
        self.reference = try container.decodeIfPresent(String.self, forKey: .reference)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.display, forKey: .display)
        try container.encodeIfPresent(self.reference, forKey: .reference)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Reference.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Reference. Will return empty instance: \(error))")
		}
		return Reference.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Reference else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        display = o.display
        reference = o.reference
    }
}

