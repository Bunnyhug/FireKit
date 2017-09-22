//
//  DocumentManifest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DocumentManifest) on 2017-09-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A manifest that defines a set of documents.
 */
open class DocumentManifest: DomainResource {
	override open class var resourceType: String {
		get { return "DocumentManifest" }
	}

    public let author = RealmSwift.List<Reference>()
    public let content = RealmSwift.List<DocumentManifestContent>()
    @objc public dynamic var created: DateTime?
    @objc public dynamic var description_fhir: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var masterIdentifier: Identifier?
    public func upsert(masterIdentifier: Identifier?) {
        upsert(prop: &self.masterIdentifier, val: masterIdentifier)
    }
    public let recipient = RealmSwift.List<Reference>()
    public let related = RealmSwift.List<DocumentManifestRelated>()
    @objc public dynamic var source: String?
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
    public convenience init(content: [DocumentManifestContent], status: String) {
        self.init()
        self.content.append(objectsIn: content)
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case author = "author"
        case content = "content"
        case created = "created"
        case description_fhir = "description"
        case identifier = "identifier"
        case masterIdentifier = "masterIdentifier"
        case recipient = "recipient"
        case related = "related"
        case source = "source"
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

        self.author.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .author) ?? [])
        self.content.append(objectsIn: try container.decodeIfPresent([DocumentManifestContent].self, forKey: .content) ?? [])
        self.created = try container.decodeIfPresent(DateTime.self, forKey: .created)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.masterIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .masterIdentifier)
        self.recipient.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .recipient) ?? [])
        self.related.append(objectsIn: try container.decodeIfPresent([DocumentManifestRelated].self, forKey: .related) ?? [])
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.author), forKey: .author)
        try container.encode(Array(self.content), forKey: .content)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.masterIdentifier, forKey: .masterIdentifier)
        try container.encode(Array(self.recipient), forKey: .recipient)
        try container.encode(Array(self.related), forKey: .related)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DocumentManifest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentManifest. Will return empty instance: \(error))")
		}
		return DocumentManifest.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DocumentManifest else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.author.enumerated() {
            guard index < self.author.count else {
                self.author.append(t)
                continue
            }
            self.author[index].populate(from: t)
        }
    
        if self.author.count > o.author.count {
            for i in self.author.count...o.author.count {
                let objectToRemove = self.author[i]
                self.author.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.content.enumerated() {
            guard index < self.content.count else {
                self.content.append(t)
                continue
            }
            self.content[index].populate(from: t)
        }
    
        if self.content.count > o.content.count {
            for i in self.content.count...o.content.count {
                let objectToRemove = self.content[i]
                self.content.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.created, from: o.created)
        description_fhir = o.description_fhir

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        if self.identifier.count > o.identifier.count {
            for i in self.identifier.count...o.identifier.count {
                let objectToRemove = self.identifier[i]
                self.identifier.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.masterIdentifier, from: o.masterIdentifier)

        for (index, t) in o.recipient.enumerated() {
            guard index < self.recipient.count else {
                self.recipient.append(t)
                continue
            }
            self.recipient[index].populate(from: t)
        }
    
        if self.recipient.count > o.recipient.count {
            for i in self.recipient.count...o.recipient.count {
                let objectToRemove = self.recipient[i]
                self.recipient.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.related.enumerated() {
            guard index < self.related.count else {
                self.related.append(t)
                continue
            }
            self.related[index].populate(from: t)
        }
    
        if self.related.count > o.related.count {
            for i in self.related.count...o.related.count {
                let objectToRemove = self.related[i]
                self.related.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        source = o.source
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)
        FireKit.populate(&self.type, from: o.type)
    }
}


/**
 *  The items included.
 *
 *  The list of Documents included in the manifest.
 */
open class DocumentManifestContent: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentManifestContent" }
	}

    @objc public dynamic var pAttachment: Attachment?
    public func upsert(pAttachment: Attachment?) {
        upsert(prop: &self.pAttachment, val: pAttachment)
    }
    @objc public dynamic var pReference: Reference?
    public func upsert(pReference: Reference?) {
        upsert(prop: &self.pReference, val: pReference)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(pAttachment: Attachment, pReference: Reference) {
        self.init()
        self.pAttachment = pAttachment
        self.pReference = pReference
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case pAttachment = "pAttachment"
        case pReference = "pReference"
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

        self.pAttachment = try container.decodeIfPresent(Attachment.self, forKey: .pAttachment)
        self.pReference = try container.decodeIfPresent(Reference.self, forKey: .pReference)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.pAttachment, forKey: .pAttachment)
        try container.encodeIfPresent(self.pReference, forKey: .pReference)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DocumentManifestContent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentManifestContent. Will return empty instance: \(error))")
		}
		return DocumentManifestContent.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DocumentManifestContent else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.pAttachment, from: o.pAttachment)
        FireKit.populate(&self.pReference, from: o.pReference)
    }
}


/**
 *  Related things.
 *
 *  Related identifiers or resources associated with the DocumentManifest.
 */
open class DocumentManifestRelated: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentManifestRelated" }
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
			let clone = try JSONDecoder().decode(DocumentManifestRelated.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentManifestRelated. Will return empty instance: \(error))")
		}
		return DocumentManifestRelated.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DocumentManifestRelated else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.ref, from: o.ref)
    }
}

