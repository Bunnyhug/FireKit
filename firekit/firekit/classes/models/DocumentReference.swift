//
//  DocumentReference.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DocumentReference) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A reference to a document.
 *
 *  A reference to a document .
 */
open class DocumentReference: DomainResource {
	override open class var resourceType: String {
		get { return "DocumentReference" }
	}

    @objc public dynamic var authenticator: Reference?
    public func upsert(authenticator: Reference?) {
        upsert(prop: &self.authenticator, val: authenticator)
    }
    public let author = RealmSwift.List<Reference>()
    @objc public dynamic var class_fhir: CodeableConcept?
    public func upsert(class_fhir: CodeableConcept?) {
        upsert(prop: &self.class_fhir, val: class_fhir)
    }
    public let content = RealmSwift.List<DocumentReferenceContent>()
    @objc public dynamic var context: DocumentReferenceContext?
    public func upsert(context: DocumentReferenceContext?) {
        upsert(prop: &self.context, val: context)
    }
    @objc public dynamic var created: DateTime?
    @objc public dynamic var custodian: Reference?
    public func upsert(custodian: Reference?) {
        upsert(prop: &self.custodian, val: custodian)
    }
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var docStatus: CodeableConcept?
    public func upsert(docStatus: CodeableConcept?) {
        upsert(prop: &self.docStatus, val: docStatus)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var indexed: Instant?
    @objc public dynamic var masterIdentifier: Identifier?
    public func upsert(masterIdentifier: Identifier?) {
        upsert(prop: &self.masterIdentifier, val: masterIdentifier)
    }
    public let relatesTo = RealmSwift.List<DocumentReferenceRelatesTo>()
    public let securityLabel = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(content: [DocumentReferenceContent], indexed: Instant, status: String, type: CodeableConcept) {
        self.init()
        self.content.append(objectsIn: content)
        self.indexed = indexed
        self.status = status
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case authenticator = "authenticator"
        case author = "author"
        case class_fhir = "class"
        case content = "content"
        case context = "context"
        case created = "created"
        case custodian = "custodian"
        case description_fhir = "description"
        case docStatus = "docStatus"
        case identifier = "identifier"
        case indexed = "indexed"
        case masterIdentifier = "masterIdentifier"
        case relatesTo = "relatesTo"
        case securityLabel = "securityLabel"
        case status = "status"
        case subject = "subject"
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

        self.authenticator = try container.decodeIfPresent(Reference.self, forKey: .authenticator)
        self.author.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .author) ?? [])
        self.class_fhir = try container.decodeIfPresent(CodeableConcept.self, forKey: .class_fhir)
        self.content.append(objectsIn: try container.decodeIfPresent([DocumentReferenceContent].self, forKey: .content) ?? [])
        self.context = try container.decodeIfPresent(DocumentReferenceContext.self, forKey: .context)
        self.created = try container.decodeIfPresent(DateTime.self, forKey: .created)
        self.custodian = try container.decodeIfPresent(Reference.self, forKey: .custodian)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.docStatus = try container.decodeIfPresent(CodeableConcept.self, forKey: .docStatus)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.indexed = try container.decodeIfPresent(Instant.self, forKey: .indexed)
        self.masterIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .masterIdentifier)
        self.relatesTo.append(objectsIn: try container.decodeIfPresent([DocumentReferenceRelatesTo].self, forKey: .relatesTo) ?? [])
        self.securityLabel.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .securityLabel) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.authenticator, forKey: .authenticator)
        try container.encode(Array(self.author), forKey: .author)
        try container.encodeIfPresent(self.class_fhir, forKey: .class_fhir)
        try container.encode(Array(self.content), forKey: .content)
        try container.encodeIfPresent(self.context, forKey: .context)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encodeIfPresent(self.custodian, forKey: .custodian)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.docStatus, forKey: .docStatus)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.indexed, forKey: .indexed)
        try container.encodeIfPresent(self.masterIdentifier, forKey: .masterIdentifier)
        try container.encode(Array(self.relatesTo), forKey: .relatesTo)
        try container.encode(Array(self.securityLabel), forKey: .securityLabel)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DocumentReference.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentReference. Will return empty instance: \(error))")
		}
		return DocumentReference.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DocumentReference else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.authenticator, from: o.authenticator)

        for (index, t) in o.author.enumerated() {
            guard index < self.author.count else {
                self.author.append(t)
                continue
            }
            self.author[index].populate(from: t)
        }
    
        while self.author.count > o.author.count {
            let objectToRemove = self.author.last!
            self.author.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.class_fhir, from: o.class_fhir)

        for (index, t) in o.content.enumerated() {
            guard index < self.content.count else {
                self.content.append(t)
                continue
            }
            self.content[index].populate(from: t)
        }
    
        while self.content.count > o.content.count {
            let objectToRemove = self.content.last!
            self.content.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.context, from: o.context)
        FireKit.populate(&self.created, from: o.created)
        FireKit.populate(&self.custodian, from: o.custodian)
        description_fhir = o.description_fhir
        FireKit.populate(&self.docStatus, from: o.docStatus)

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
        FireKit.populate(&self.indexed, from: o.indexed)
        FireKit.populate(&self.masterIdentifier, from: o.masterIdentifier)

        for (index, t) in o.relatesTo.enumerated() {
            guard index < self.relatesTo.count else {
                self.relatesTo.append(t)
                continue
            }
            self.relatesTo[index].populate(from: t)
        }
    
        while self.relatesTo.count > o.relatesTo.count {
            let objectToRemove = self.relatesTo.last!
            self.relatesTo.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

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
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)
        FireKit.populate(&self.type, from: o.type)
    }
}


/**
 *  Document referenced.
 *
 *  The document and format referenced. There may be multiple content element repetitions, each with a different format.
 */
open class DocumentReferenceContent: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentReferenceContent" }
	}

    @objc public dynamic var attachment: Attachment?
    public func upsert(attachment: Attachment?) {
        upsert(prop: &self.attachment, val: attachment)
    }
    public let format = RealmSwift.List<Coding>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(attachment: Attachment) {
        self.init()
        self.attachment = attachment
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case attachment = "attachment"
        case format = "format"
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

        self.attachment = try container.decodeIfPresent(Attachment.self, forKey: .attachment)
        self.format.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .format) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.attachment, forKey: .attachment)
        try container.encode(Array(self.format), forKey: .format)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DocumentReferenceContent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentReferenceContent. Will return empty instance: \(error))")
		}
		return DocumentReferenceContent.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DocumentReferenceContent else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.attachment, from: o.attachment)

        for (index, t) in o.format.enumerated() {
            guard index < self.format.count else {
                self.format.append(t)
                continue
            }
            self.format[index].populate(from: t)
        }
    
        while self.format.count > o.format.count {
            let objectToRemove = self.format.last!
            self.format.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
    }
}


/**
 *  Clinical context of document.
 *
 *  The clinical context in which the document was prepared.
 */
open class DocumentReferenceContext: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentReferenceContext" }
	}

    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let event = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var facilityType: CodeableConcept?
    public func upsert(facilityType: CodeableConcept?) {
        upsert(prop: &self.facilityType, val: facilityType)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    @objc public dynamic var practiceSetting: CodeableConcept?
    public func upsert(practiceSetting: CodeableConcept?) {
        upsert(prop: &self.practiceSetting, val: practiceSetting)
    }
    public let related = RealmSwift.List<DocumentReferenceContextRelated>()
    @objc public dynamic var sourcePatientInfo: Reference?
    public func upsert(sourcePatientInfo: Reference?) {
        upsert(prop: &self.sourcePatientInfo, val: sourcePatientInfo)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case encounter = "encounter"
        case event = "event"
        case facilityType = "facilityType"
        case period = "period"
        case practiceSetting = "practiceSetting"
        case related = "related"
        case sourcePatientInfo = "sourcePatientInfo"
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

        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.event.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .event) ?? [])
        self.facilityType = try container.decodeIfPresent(CodeableConcept.self, forKey: .facilityType)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.practiceSetting = try container.decodeIfPresent(CodeableConcept.self, forKey: .practiceSetting)
        self.related.append(objectsIn: try container.decodeIfPresent([DocumentReferenceContextRelated].self, forKey: .related) ?? [])
        self.sourcePatientInfo = try container.decodeIfPresent(Reference.self, forKey: .sourcePatientInfo)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.event), forKey: .event)
        try container.encodeIfPresent(self.facilityType, forKey: .facilityType)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.practiceSetting, forKey: .practiceSetting)
        try container.encode(Array(self.related), forKey: .related)
        try container.encodeIfPresent(self.sourcePatientInfo, forKey: .sourcePatientInfo)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DocumentReferenceContext.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentReferenceContext. Will return empty instance: \(error))")
		}
		return DocumentReferenceContext.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DocumentReferenceContext else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.encounter, from: o.encounter)

        for (index, t) in o.event.enumerated() {
            guard index < self.event.count else {
                self.event.append(t)
                continue
            }
            self.event[index].populate(from: t)
        }
    
        while self.event.count > o.event.count {
            let objectToRemove = self.event.last!
            self.event.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.facilityType, from: o.facilityType)
        FireKit.populate(&self.period, from: o.period)
        FireKit.populate(&self.practiceSetting, from: o.practiceSetting)

        for (index, t) in o.related.enumerated() {
            guard index < self.related.count else {
                self.related.append(t)
                continue
            }
            self.related[index].populate(from: t)
        }
    
        while self.related.count > o.related.count {
            let objectToRemove = self.related.last!
            self.related.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.sourcePatientInfo, from: o.sourcePatientInfo)
    }
}


/**
 *  Related identifiers or resources.
 *
 *  Related identifiers or resources associated with the DocumentReference.
 */
open class DocumentReferenceContextRelated: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentReferenceContextRelated" }
	}

    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var ref: Reference?
    public func upsert(ref: Reference?) {
        upsert(prop: &self.ref, val: ref)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case identifier = "identifier"
        case ref = "ref"
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
        self.ref = try container.decodeIfPresent(Reference.self, forKey: .ref)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.ref, forKey: .ref)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DocumentReferenceContextRelated.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentReferenceContextRelated. Will return empty instance: \(error))")
		}
		return DocumentReferenceContextRelated.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DocumentReferenceContextRelated else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.ref, from: o.ref)
    }
}


/**
 *  Relationships to other documents.
 *
 *  Relationships that this document has with other document references that already exist.
 */
open class DocumentReferenceRelatesTo: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentReferenceRelatesTo" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var target: Reference?
    public func upsert(target: Reference?) {
        upsert(prop: &self.target, val: target)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String, target: Reference) {
        self.init()
        self.code = code
        self.target = target
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
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

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.target = try container.decodeIfPresent(Reference.self, forKey: .target)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.target, forKey: .target)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DocumentReferenceRelatesTo.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentReferenceRelatesTo. Will return empty instance: \(error))")
		}
		return DocumentReferenceRelatesTo.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DocumentReferenceRelatesTo else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        code = o.code
        FireKit.populate(&self.target, from: o.target)
    }
}

