//
//  AuditEvent.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/AuditEvent) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Event record kept for security purposes.
 *
 *  A record of an event made for purposes of maintaining a security log. Typical uses include detection of intrusion
 *  attempts and monitoring for inappropriate usage.
 */
open class AuditEvent: DomainResource {
	override open class var resourceType: String {
		get { return "AuditEvent" }
	}

    @objc public dynamic var event: AuditEventEvent?
    public func upsert(event: AuditEventEvent?) {
        upsert(prop: &self.event, val: event)
    }
    public let object = RealmSwift.List<AuditEventObject>()
    public let participant = RealmSwift.List<AuditEventParticipant>()
    @objc public dynamic var source: AuditEventSource?
    public func upsert(source: AuditEventSource?) {
        upsert(prop: &self.source, val: source)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(event: AuditEventEvent, participant: [AuditEventParticipant], source: AuditEventSource) {
        self.init()
        self.event = event
        self.participant.append(objectsIn: participant)
        self.source = source
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case event = "event"
        case object = "object"
        case participant = "participant"
        case source = "source"
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

        self.event = try container.decodeIfPresent(AuditEventEvent.self, forKey: .event)
        self.object.append(objectsIn: try container.decodeIfPresent([AuditEventObject].self, forKey: .object) ?? [])
        self.participant.append(objectsIn: try container.decodeIfPresent([AuditEventParticipant].self, forKey: .participant) ?? [])
        self.source = try container.decodeIfPresent(AuditEventSource.self, forKey: .source)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.event, forKey: .event)
        try container.encode(Array(self.object), forKey: .object)
        try container.encode(Array(self.participant), forKey: .participant)
        try container.encodeIfPresent(self.source, forKey: .source)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(AuditEvent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy AuditEvent. Will return empty instance: \(error))")
		}
		return AuditEvent.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? AuditEvent else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.event, from: o.event)

        for (index, t) in o.object.enumerated() {
            guard index < self.object.count else {
                self.object.append(t)
                continue
            }
            self.object[index].populate(from: t)
        }
    
        while self.object.count > o.object.count {
            let objectToRemove = self.object.last!
            self.object.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.participant.enumerated() {
            guard index < self.participant.count else {
                self.participant.append(t)
                continue
            }
            self.participant[index].populate(from: t)
        }
    
        while self.participant.count > o.participant.count {
            let objectToRemove = self.participant.last!
            self.participant.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.source, from: o.source)
    }
}


/**
 *  What was done.
 *
 *  Identifies the name, action type, time, and disposition of the audited event.
 */
open class AuditEventEvent: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventEvent" }
	}

    @objc public dynamic var action: String?
    @objc public dynamic var dateTime: Instant?
    @objc public dynamic var outcome: String?
    @objc public dynamic var outcomeDesc: String?
    public let purposeOfEvent = RealmSwift.List<Coding>()
    public let subtype = RealmSwift.List<Coding>()
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(dateTime: Instant, type: Coding) {
        self.init()
        self.dateTime = dateTime
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
        case dateTime = "dateTime"
        case outcome = "outcome"
        case outcomeDesc = "outcomeDesc"
        case purposeOfEvent = "purposeOfEvent"
        case subtype = "subtype"
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

        self.action = try container.decodeIfPresent(String.self, forKey: .action)
        self.dateTime = try container.decodeIfPresent(Instant.self, forKey: .dateTime)
        self.outcome = try container.decodeIfPresent(String.self, forKey: .outcome)
        self.outcomeDesc = try container.decodeIfPresent(String.self, forKey: .outcomeDesc)
        self.purposeOfEvent.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .purposeOfEvent) ?? [])
        self.subtype.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .subtype) ?? [])
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.action, forKey: .action)
        try container.encodeIfPresent(self.dateTime, forKey: .dateTime)
        try container.encodeIfPresent(self.outcome, forKey: .outcome)
        try container.encodeIfPresent(self.outcomeDesc, forKey: .outcomeDesc)
        try container.encode(Array(self.purposeOfEvent), forKey: .purposeOfEvent)
        try container.encode(Array(self.subtype), forKey: .subtype)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(AuditEventEvent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy AuditEventEvent. Will return empty instance: \(error))")
		}
		return AuditEventEvent.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? AuditEventEvent else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        action = o.action
        FireKit.populate(&self.dateTime, from: o.dateTime)
        outcome = o.outcome
        outcomeDesc = o.outcomeDesc

        for (index, t) in o.purposeOfEvent.enumerated() {
            guard index < self.purposeOfEvent.count else {
                self.purposeOfEvent.append(t)
                continue
            }
            self.purposeOfEvent[index].populate(from: t)
        }
    
        while self.purposeOfEvent.count > o.purposeOfEvent.count {
            let objectToRemove = self.purposeOfEvent.last!
            self.purposeOfEvent.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.subtype.enumerated() {
            guard index < self.subtype.count else {
                self.subtype.append(t)
                continue
            }
            self.subtype[index].populate(from: t)
        }
    
        while self.subtype.count > o.subtype.count {
            let objectToRemove = self.subtype.last!
            self.subtype.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.type, from: o.type)
    }
}


/**
 *  Specific instances of data or objects that have been accessed.
 */
open class AuditEventObject: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventObject" }
	}

    @objc public dynamic var description_fhir: String?
    public let detail = RealmSwift.List<AuditEventObjectDetail>()
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var lifecycle: Coding?
    public func upsert(lifecycle: Coding?) {
        upsert(prop: &self.lifecycle, val: lifecycle)
    }
    @objc public dynamic var name: String?
    @objc public dynamic var query: Base64Binary?
    @objc public dynamic var reference: Reference?
    public func upsert(reference: Reference?) {
        upsert(prop: &self.reference, val: reference)
    }
    @objc public dynamic var role: Coding?
    public func upsert(role: Coding?) {
        upsert(prop: &self.role, val: role)
    }
    public let securityLabel = RealmSwift.List<Coding>()
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case description_fhir = "description"
        case detail = "detail"
        case identifier = "identifier"
        case lifecycle = "lifecycle"
        case name = "name"
        case query = "query"
        case reference = "reference"
        case role = "role"
        case securityLabel = "securityLabel"
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

        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.detail.append(objectsIn: try container.decodeIfPresent([AuditEventObjectDetail].self, forKey: .detail) ?? [])
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.lifecycle = try container.decodeIfPresent(Coding.self, forKey: .lifecycle)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.query = try container.decodeIfPresent(Base64Binary.self, forKey: .query)
        self.reference = try container.decodeIfPresent(Reference.self, forKey: .reference)
        self.role = try container.decodeIfPresent(Coding.self, forKey: .role)
        self.securityLabel.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .securityLabel) ?? [])
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.detail), forKey: .detail)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.lifecycle, forKey: .lifecycle)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.query, forKey: .query)
        try container.encodeIfPresent(self.reference, forKey: .reference)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encode(Array(self.securityLabel), forKey: .securityLabel)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(AuditEventObject.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy AuditEventObject. Will return empty instance: \(error))")
		}
		return AuditEventObject.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? AuditEventObject else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        description_fhir = o.description_fhir

        for (index, t) in o.detail.enumerated() {
            guard index < self.detail.count else {
                self.detail.append(t)
                continue
            }
            self.detail[index].populate(from: t)
        }
    
        while self.detail.count > o.detail.count {
            let objectToRemove = self.detail.last!
            self.detail.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.lifecycle, from: o.lifecycle)
        name = o.name
        query = o.query
        FireKit.populate(&self.reference, from: o.reference)
        FireKit.populate(&self.role, from: o.role)

        for (index, t) in o.securityLabel.enumerated() {
            guard index < self.securityLabel.count else {
                self.securityLabel.append(t)
                continue
            }
            self.securityLabel[index].populate(from: t)
        }
    
        while self.securityLabel.count > o.securityLabel.count {
            let objectToRemove = self.securityLabel.last!
            self.securityLabel.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.type, from: o.type)
    }
}


/**
 *  Additional Information about the Object.
 */
open class AuditEventObjectDetail: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventObjectDetail" }
	}

    @objc public dynamic var type: String?
    @objc public dynamic var value: Base64Binary?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: String, val: Base64Binary) {
        self.init()
        self.type = type
        self.value = val
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case type = "type"
        case value = "value"
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

        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.value = try container.decodeIfPresent(Base64Binary.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.value, forKey: .value)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(AuditEventObjectDetail.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy AuditEventObjectDetail. Will return empty instance: \(error))")
		}
		return AuditEventObjectDetail.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? AuditEventObjectDetail else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        type = o.type
        value = o.value
    }
}


/**
 *  A person, a hardware device or software process.
 */
open class AuditEventParticipant: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventParticipant" }
	}

    @objc public dynamic var altId: String?
    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    @objc public dynamic var media: Coding?
    public func upsert(media: Coding?) {
        upsert(prop: &self.media, val: media)
    }
    @objc public dynamic var name: String?
    @objc public dynamic var network: AuditEventParticipantNetwork?
    public func upsert(network: AuditEventParticipantNetwork?) {
        upsert(prop: &self.network, val: network)
    }
    public let policy = RealmSwift.List<RealmString>()
    public let purposeOfUse = RealmSwift.List<Coding>()
    @objc public dynamic var reference: Reference?
    public func upsert(reference: Reference?) {
        upsert(prop: &self.reference, val: reference)
    }
    public let requestor = RealmOptional<Bool>()
    public let role = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var userId: Identifier?
    public func upsert(userId: Identifier?) {
        upsert(prop: &self.userId, val: userId)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(requestor: Bool) {
        self.init()
        self.requestor.value = requestor
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case altId = "altId"
        case location = "location"
        case media = "media"
        case name = "name"
        case network = "network"
        case policy = "policy"
        case purposeOfUse = "purposeOfUse"
        case reference = "reference"
        case requestor = "requestor"
        case role = "role"
        case userId = "userId"
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

        self.altId = try container.decodeIfPresent(String.self, forKey: .altId)
        self.location = try container.decodeIfPresent(Reference.self, forKey: .location)
        self.media = try container.decodeIfPresent(Coding.self, forKey: .media)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.network = try container.decodeIfPresent(AuditEventParticipantNetwork.self, forKey: .network)
        self.policy.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .policy) ?? [])
        self.purposeOfUse.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .purposeOfUse) ?? [])
        self.reference = try container.decodeIfPresent(Reference.self, forKey: .reference)
        self.requestor.value = try container.decodeIfPresent(Bool.self, forKey: .requestor)
        self.role.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .role) ?? [])
        self.userId = try container.decodeIfPresent(Identifier.self, forKey: .userId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.altId, forKey: .altId)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.media, forKey: .media)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.network, forKey: .network)
        try container.encode(Array(self.policy), forKey: .policy)
        try container.encode(Array(self.purposeOfUse), forKey: .purposeOfUse)
        try container.encodeIfPresent(self.reference, forKey: .reference)
        try container.encodeIfPresent(self.requestor.value, forKey: .requestor)
        try container.encode(Array(self.role), forKey: .role)
        try container.encodeIfPresent(self.userId, forKey: .userId)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(AuditEventParticipant.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy AuditEventParticipant. Will return empty instance: \(error))")
		}
		return AuditEventParticipant.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? AuditEventParticipant else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        altId = o.altId
        FireKit.populate(&self.location, from: o.location)
        FireKit.populate(&self.media, from: o.media)
        name = o.name
        FireKit.populate(&self.network, from: o.network)

        for (index, t) in o.policy.enumerated() {
            guard index < self.policy.count else {
                self.policy.append(t)
                continue
            }
            self.policy[index].populate(from: t)
        }
    
        while self.policy.count > o.policy.count {
            let objectToRemove = self.policy.last!
            self.policy.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.purposeOfUse.enumerated() {
            guard index < self.purposeOfUse.count else {
                self.purposeOfUse.append(t)
                continue
            }
            self.purposeOfUse[index].populate(from: t)
        }
    
        while self.purposeOfUse.count > o.purposeOfUse.count {
            let objectToRemove = self.purposeOfUse.last!
            self.purposeOfUse.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.reference, from: o.reference)
        requestor.value = o.requestor.value

        for (index, t) in o.role.enumerated() {
            guard index < self.role.count else {
                self.role.append(t)
                continue
            }
            self.role[index].populate(from: t)
        }
    
        while self.role.count > o.role.count {
            let objectToRemove = self.role.last!
            self.role.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.userId, from: o.userId)
    }
}


/**
 *  Logical network location for application activity.
 *
 *  Logical network location for application activity, if the activity has a network location.
 */
open class AuditEventParticipantNetwork: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventParticipantNetwork" }
	}

    @objc public dynamic var address: String?
    @objc public dynamic var type: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case address = "address"
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

        self.address = try container.decodeIfPresent(String.self, forKey: .address)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(AuditEventParticipantNetwork.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy AuditEventParticipantNetwork. Will return empty instance: \(error))")
		}
		return AuditEventParticipantNetwork.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? AuditEventParticipantNetwork else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        address = o.address
        type = o.type
    }
}


/**
 *  Application systems and processes.
 */
open class AuditEventSource: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventSource" }
	}

    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var site: String?
    public let type = RealmSwift.List<Coding>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(identifier: Identifier) {
        self.init()
        self.identifier = identifier
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case identifier = "identifier"
        case site = "site"
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

        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.site = try container.decodeIfPresent(String.self, forKey: .site)
        self.type.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .type) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.site, forKey: .site)
        try container.encode(Array(self.type), forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(AuditEventSource.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy AuditEventSource. Will return empty instance: \(error))")
		}
		return AuditEventSource.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? AuditEventSource else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.identifier, from: o.identifier)
        site = o.site

        for (index, t) in o.type.enumerated() {
            guard index < self.type.count else {
                self.type.append(t)
                continue
            }
            self.type[index].populate(from: t)
        }
    
        while self.type.count > o.type.count {
            let objectToRemove = self.type.last!
            self.type.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
    }
}

