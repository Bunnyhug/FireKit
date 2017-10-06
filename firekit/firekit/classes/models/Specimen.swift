//
//  Specimen.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Specimen) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Sample for analysis.
 *
 *  A sample to be used for analysis.
 */
open class Specimen: DomainResource {
	override open class var resourceType: String {
		get { return "Specimen" }
	}

    @objc public dynamic var accessionIdentifier: Identifier?
    public func upsert(accessionIdentifier: Identifier?) {
        upsert(prop: &self.accessionIdentifier, val: accessionIdentifier)
    }
    @objc public dynamic var collection: SpecimenCollection?
    public func upsert(collection: SpecimenCollection?) {
        upsert(prop: &self.collection, val: collection)
    }
    public let container = RealmSwift.List<SpecimenContainer>()
    public let identifier = RealmSwift.List<Identifier>()
    public let parent = RealmSwift.List<Reference>()
    @objc public dynamic var receivedTime: DateTime?
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    public let treatment = RealmSwift.List<SpecimenTreatment>()
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(subject: Reference) {
        self.init()
        self.subject = subject
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case accessionIdentifier = "accessionIdentifier"
        case collection = "collection"
        case container = "container"
        case identifier = "identifier"
        case parent = "parent"
        case receivedTime = "receivedTime"
        case status = "status"
        case subject = "subject"
        case treatment = "treatment"
        case type = "type"
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

        self.accessionIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .accessionIdentifier)
        self.collection = try container.decodeIfPresent(SpecimenCollection.self, forKey: .collection)
        self.container.append(objectsIn: try container.decodeIfPresent([SpecimenContainer].self, forKey: .container) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.parent.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .parent) ?? [])
        self.receivedTime = try container.decodeIfPresent(DateTime.self, forKey: .receivedTime)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.treatment.append(objectsIn: try container.decodeIfPresent([SpecimenTreatment].self, forKey: .treatment) ?? [])
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.accessionIdentifier, forKey: .accessionIdentifier)
        try container.encodeIfPresent(self.collection, forKey: .collection)
        try container.encode(Array(self.container), forKey: .container)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.parent), forKey: .parent)
        try container.encodeIfPresent(self.receivedTime, forKey: .receivedTime)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encode(Array(self.treatment), forKey: .treatment)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Specimen.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Specimen. Will return empty instance: \(error))")
		}
		return Specimen.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Specimen else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.accessionIdentifier, from: o.accessionIdentifier)
        FireKit.populate(&self.collection, from: o.collection)

        for (index, t) in o.container.enumerated() {
            guard index < self.container.count else {
                self.container.append(t)
                continue
            }
            self.container[index].populate(from: t)
        }
    
        while self.container.count > o.container.count {
            let objectToRemove = self.container.last!
            self.container.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

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

        for (index, t) in o.parent.enumerated() {
            guard index < self.parent.count else {
                self.parent.append(t)
                continue
            }
            self.parent[index].populate(from: t)
        }
    
        while self.parent.count > o.parent.count {
            let objectToRemove = self.parent.last!
            self.parent.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.receivedTime, from: o.receivedTime)
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)

        for (index, t) in o.treatment.enumerated() {
            guard index < self.treatment.count else {
                self.treatment.append(t)
                continue
            }
            self.treatment[index].populate(from: t)
        }
    
        while self.treatment.count > o.treatment.count {
            let objectToRemove = self.treatment.last!
            self.treatment.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.type, from: o.type)
    }
}


/**
 *  Collection details.
 *
 *  Details concerning the specimen collection.
 */
open class SpecimenCollection: BackboneElement {
	override open class var resourceType: String {
		get { return "SpecimenCollection" }
	}

    @objc public dynamic var bodySite: CodeableConcept?
    public func upsert(bodySite: CodeableConcept?) {
        upsert(prop: &self.bodySite, val: bodySite)
    }
    @objc public dynamic var collectedDateTime: DateTime?
    @objc public dynamic var collectedPeriod: Period?
    public func upsert(collectedPeriod: Period?) {
        upsert(prop: &self.collectedPeriod, val: collectedPeriod)
    }
    @objc public dynamic var collector: Reference?
    public func upsert(collector: Reference?) {
        upsert(prop: &self.collector, val: collector)
    }
    public let comment = RealmSwift.List<RealmString>()
    @objc public dynamic var method: CodeableConcept?
    public func upsert(method: CodeableConcept?) {
        upsert(prop: &self.method, val: method)
    }
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case bodySite = "bodySite"
        case collectedDateTime = "collectedDateTime"
        case collectedPeriod = "collectedPeriod"
        case collector = "collector"
        case comment = "comment"
        case method = "method"
        case quantity = "quantity"
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

        self.bodySite = try container.decodeIfPresent(CodeableConcept.self, forKey: .bodySite)
        self.collectedDateTime = try container.decodeIfPresent(DateTime.self, forKey: .collectedDateTime)
        self.collectedPeriod = try container.decodeIfPresent(Period.self, forKey: .collectedPeriod)
        self.collector = try container.decodeIfPresent(Reference.self, forKey: .collector)
        self.comment.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .comment) ?? [])
        self.method = try container.decodeIfPresent(CodeableConcept.self, forKey: .method)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.bodySite, forKey: .bodySite)
        try container.encodeIfPresent(self.collectedDateTime, forKey: .collectedDateTime)
        try container.encodeIfPresent(self.collectedPeriod, forKey: .collectedPeriod)
        try container.encodeIfPresent(self.collector, forKey: .collector)
        try container.encode(Array(self.comment), forKey: .comment)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SpecimenCollection.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SpecimenCollection. Will return empty instance: \(error))")
		}
		return SpecimenCollection.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? SpecimenCollection else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.bodySite, from: o.bodySite)
        FireKit.populate(&self.collectedDateTime, from: o.collectedDateTime)
        FireKit.populate(&self.collectedPeriod, from: o.collectedPeriod)
        FireKit.populate(&self.collector, from: o.collector)

        for (index, t) in o.comment.enumerated() {
            guard index < self.comment.count else {
                self.comment.append(t)
                continue
            }
            self.comment[index].populate(from: t)
        }
    
        while self.comment.count > o.comment.count {
            let objectToRemove = self.comment.last!
            self.comment.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.method, from: o.method)
        FireKit.populate(&self.quantity, from: o.quantity)
    }
}


/**
 *  Direct container of specimen (tube/slide, etc.).
 *
 *  The container holding the specimen.  The recursive nature of containers; i.e. blood in tube in tray in rack is not
 *  addressed here.
 */
open class SpecimenContainer: BackboneElement {
	override open class var resourceType: String {
		get { return "SpecimenContainer" }
	}

    @objc public dynamic var additiveCodeableConcept: CodeableConcept?
    public func upsert(additiveCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.additiveCodeableConcept, val: additiveCodeableConcept)
    }
    @objc public dynamic var additiveReference: Reference?
    public func upsert(additiveReference: Reference?) {
        upsert(prop: &self.additiveReference, val: additiveReference)
    }
    @objc public dynamic var capacity: Quantity?
    public func upsert(capacity: Quantity?) {
        upsert(prop: &self.capacity, val: capacity)
    }
    @objc public dynamic var description_fhir: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var specimenQuantity: Quantity?
    public func upsert(specimenQuantity: Quantity?) {
        upsert(prop: &self.specimenQuantity, val: specimenQuantity)
    }
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case additiveCodeableConcept = "additiveCodeableConcept"
        case additiveReference = "additiveReference"
        case capacity = "capacity"
        case description_fhir = "description"
        case identifier = "identifier"
        case specimenQuantity = "specimenQuantity"
        case type = "type"
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

        self.additiveCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .additiveCodeableConcept)
        self.additiveReference = try container.decodeIfPresent(Reference.self, forKey: .additiveReference)
        self.capacity = try container.decodeIfPresent(Quantity.self, forKey: .capacity)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.specimenQuantity = try container.decodeIfPresent(Quantity.self, forKey: .specimenQuantity)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.additiveCodeableConcept, forKey: .additiveCodeableConcept)
        try container.encodeIfPresent(self.additiveReference, forKey: .additiveReference)
        try container.encodeIfPresent(self.capacity, forKey: .capacity)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.specimenQuantity, forKey: .specimenQuantity)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SpecimenContainer.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SpecimenContainer. Will return empty instance: \(error))")
		}
		return SpecimenContainer.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? SpecimenContainer else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.additiveCodeableConcept, from: o.additiveCodeableConcept)
        FireKit.populate(&self.additiveReference, from: o.additiveReference)
        FireKit.populate(&self.capacity, from: o.capacity)
        description_fhir = o.description_fhir

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
        FireKit.populate(&self.specimenQuantity, from: o.specimenQuantity)
        FireKit.populate(&self.type, from: o.type)
    }
}


/**
 *  Treatment and processing step details.
 *
 *  Details concerning treatment and processing steps for the specimen.
 */
open class SpecimenTreatment: BackboneElement {
	override open class var resourceType: String {
		get { return "SpecimenTreatment" }
	}

    public let additive = RealmSwift.List<Reference>()
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var procedure: CodeableConcept?
    public func upsert(procedure: CodeableConcept?) {
        upsert(prop: &self.procedure, val: procedure)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case additive = "additive"
        case description_fhir = "description"
        case procedure = "procedure"
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

        self.additive.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .additive) ?? [])
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.procedure = try container.decodeIfPresent(CodeableConcept.self, forKey: .procedure)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.additive), forKey: .additive)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.procedure, forKey: .procedure)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SpecimenTreatment.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SpecimenTreatment. Will return empty instance: \(error))")
		}
		return SpecimenTreatment.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? SpecimenTreatment else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.additive.enumerated() {
            guard index < self.additive.count else {
                self.additive.append(t)
                continue
            }
            self.additive[index].populate(from: t)
        }
    
        while self.additive.count > o.additive.count {
            let objectToRemove = self.additive.last!
            self.additive.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        description_fhir = o.description_fhir
        FireKit.populate(&self.procedure, from: o.procedure)
    }
}

