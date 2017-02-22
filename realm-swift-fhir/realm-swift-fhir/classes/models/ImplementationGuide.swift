//
//  ImplementationGuide.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ImplementationGuide) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A set of rules about how FHIR is used.
 *
 *  A set of rules or how FHIR is used to solve a particular problem. This resource is used to gather all the parts of
 *  an implementation guide into a logical whole, and to publish a computable definition of all the parts.
 */
open class ImplementationGuide: DomainResource {
	override open class var resourceType: String {
		get { return "ImplementationGuide" }
	}
    
    public let binary = RealmSwift.List<RealmString>()    
    public let contact = RealmSwift.List<ImplementationGuideContact>()    
    public dynamic var copyright: String?        
        
    public dynamic var date: DateTime?        
        
    public let dependency = RealmSwift.List<ImplementationGuideDependency>()    
    public dynamic var description_fhir: String?        
        
    public let experimental = RealmOptional<Bool>()    
    public dynamic var fhirVersion: String?        
        
    public let global = RealmSwift.List<ImplementationGuideGlobal>()    
    public dynamic var name: String?        
        
    public let package = RealmSwift.List<ImplementationGuidePackage>()    
    public dynamic var page: ImplementationGuidePage?        
    public func upsert(page: ImplementationGuidePage?) {
        upsert(prop: &self.page, val: page)
    }    
    public dynamic var publisher: String?        
        
    public dynamic var status: String?        
        
    public dynamic var url: String?        
        
    public let useContext = RealmSwift.List<CodeableConcept>()    
    public dynamic var version: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String, package: [ImplementationGuidePackage], page: ImplementationGuidePage, status: String, url: String) {
        self.init(json: nil)
        self.name = name
        self.package.append(objectsIn: package)
        self.page = page
        self.status = status
        self.url = url
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["binary"] {
				presentKeys.insert("binary")
				if let val = exist as? [String] {
					self.binary.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "binary", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuideContact.instantiate(fromArray: val, owner: self) as? [ImplementationGuideContact] {
						if let realm = self.realm { realm.delete(self.contact) }
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["copyright"] {
				presentKeys.insert("copyright")
				if let val = exist as? String {
					self.copyright = val
				}
				else {
					errors.append(FHIRJSONError(key: "copyright", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["date"] {
				presentKeys.insert("date")
				if let val = exist as? String {
					self.date = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "date", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["dependency"] {
				presentKeys.insert("dependency")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuideDependency.instantiate(fromArray: val, owner: self) as? [ImplementationGuideDependency] {
						if let realm = self.realm { realm.delete(self.dependency) }
						self.dependency.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "dependency", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["experimental"] {
				presentKeys.insert("experimental")
				if let val = exist as? Bool {
					self.experimental.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "experimental", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["fhirVersion"] {
				presentKeys.insert("fhirVersion")
				if let val = exist as? String {
					self.fhirVersion = val
				}
				else {
					errors.append(FHIRJSONError(key: "fhirVersion", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["global"] {
				presentKeys.insert("global")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuideGlobal.instantiate(fromArray: val, owner: self) as? [ImplementationGuideGlobal] {
						if let realm = self.realm { realm.delete(self.global) }
						self.global.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "global", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "name"))
			}
			if let exist = js["package"] {
				presentKeys.insert("package")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuidePackage.instantiate(fromArray: val, owner: self) as? [ImplementationGuidePackage] {
						if let realm = self.realm { realm.delete(self.package) }
						self.package.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "package", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "package"))
			}
			if let exist = js["page"] {
				presentKeys.insert("page")
				if let val = exist as? FHIRJSON {
					upsert(page: ImplementationGuidePage(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "page", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "page"))
			}
			if let exist = js["publisher"] {
				presentKeys.insert("publisher")
				if let val = exist as? String {
					self.publisher = val
				}
				else {
					errors.append(FHIRJSONError(key: "publisher", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["status"] {
				presentKeys.insert("status")
				if let val = exist as? String {
					self.status = val
				}
				else {
					errors.append(FHIRJSONError(key: "status", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "status"))
			}
			if let exist = js["url"] {
				presentKeys.insert("url")
				if let val = exist as? String {
					self.url = val
				}
				else {
					errors.append(FHIRJSONError(key: "url", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "url"))
			}
			if let exist = js["useContext"] {
				presentKeys.insert("useContext")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.useContext) }
						self.useContext.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "useContext", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["version"] {
				presentKeys.insert("version")
				if let val = exist as? String {
					self.version = val
				}
				else {
					errors.append(FHIRJSONError(key: "version", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if binary.count > 0 {
			json["binary"] = Array(binary.map() { $0.value })
		}
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if let copyright = self.copyright {
			json["copyright"] = copyright.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if dependency.count > 0 {
			json["dependency"] = Array(dependency.map() { $0.asJSON() })
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let experimental = self.experimental.value {
			json["experimental"] = experimental.asJSON()
		}
		if let fhirVersion = self.fhirVersion {
			json["fhirVersion"] = fhirVersion.asJSON()
		}
		if global.count > 0 {
			json["global"] = Array(global.map() { $0.asJSON() })
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if package.count > 0 {
			json["package"] = Array(package.map() { $0.asJSON() })
		}
		if let page = self.page {
			json["page"] = page.asJSON()
		}
		if let publisher = self.publisher {
			json["publisher"] = publisher.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		if useContext.count > 0 {
			json["useContext"] = Array(useContext.map() { $0.asJSON() })
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class ImplementationGuideContact: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuideContact" }
	}
    
    public dynamic var name: String?        
        
    public let telecom = RealmSwift.List<ContactPoint>()

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["telecom"] {
				presentKeys.insert("telecom")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContactPoint.instantiate(fromArray: val, owner: self) as? [ContactPoint] {
						if let realm = self.realm { realm.delete(self.telecom) }
						self.telecom.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "telecom", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Another Implementation guide this depends on.
 *
 *  Another implementation guide that this implementation depends on. Typically, an implementation guide uses value
 *  sets, profiles etc.defined in other implementation guides.
 */
open class ImplementationGuideDependency: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuideDependency" }
	}
    
    public dynamic var type: String?        
        
    public dynamic var uri: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: String, uri: String) {
        self.init(json: nil)
        self.type = type
        self.uri = uri
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
			if let exist = js["uri"] {
				presentKeys.insert("uri")
				if let val = exist as? String {
					self.uri = val
				}
				else {
					errors.append(FHIRJSONError(key: "uri", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "uri"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let uri = self.uri {
			json["uri"] = uri.asJSON()
		}
		
		return json
	}
}


/**
 *  Profiles that apply globally.
 *
 *  A set of profiles that all resources covered by this implementation guide must conform to.
 */
open class ImplementationGuideGlobal: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuideGlobal" }
	}
    
    public dynamic var profile: Reference?        
    public func upsert(profile: Reference?) {
        upsert(prop: &self.profile, val: profile)
    }    
    public dynamic var type: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(profile: Reference, type: String) {
        self.init(json: nil)
        self.profile = profile
        self.type = type
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["profile"] {
				presentKeys.insert("profile")
				if let val = exist as? FHIRJSON {
					upsert(profile: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "profile", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "profile"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let profile = self.profile {
			json["profile"] = profile.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  Group of resources as used in .page.package.
 *
 *  A logical group of resources. Logical groups can be used when building pages.
 */
open class ImplementationGuidePackage: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuidePackage" }
	}
    
    public dynamic var description_fhir: String?        
        
    public dynamic var name: String?        
        
    public let resource = RealmSwift.List<ImplementationGuidePackageResource>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String, resource: [ImplementationGuidePackageResource]) {
        self.init(json: nil)
        self.name = name
        self.resource.append(objectsIn: resource)
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "name"))
			}
			if let exist = js["resource"] {
				presentKeys.insert("resource")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuidePackageResource.instantiate(fromArray: val, owner: self) as? [ImplementationGuidePackageResource] {
						if let realm = self.realm { realm.delete(self.resource) }
						self.resource.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "resource", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "resource"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if resource.count > 0 {
			json["resource"] = Array(resource.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Resource in the implementation guide.
 *
 *  A resource that is part of the implementation guide. Conformance resources (value set, structure definition,
 *  conformance statements etc.) are obvious candidates for inclusion, but any kind of resource can be included as an
 *  example resource.
 */
open class ImplementationGuidePackageResource: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuidePackageResource" }
	}
    
    public dynamic var acronym: String?        
        
    public dynamic var description_fhir: String?        
        
    public dynamic var exampleFor: Reference?        
    public func upsert(exampleFor: Reference?) {
        upsert(prop: &self.exampleFor, val: exampleFor)
    }    
    public dynamic var name: String?        
        
    public dynamic var purpose: String?        
        
    public dynamic var sourceReference: Reference?        
    public func upsert(sourceReference: Reference?) {
        upsert(prop: &self.sourceReference, val: sourceReference)
    }    
    public dynamic var sourceUri: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(purpose: String, sourceReference: Reference, sourceUri: String) {
        self.init(json: nil)
        self.purpose = purpose
        self.sourceReference = sourceReference
        self.sourceUri = sourceUri
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["acronym"] {
				presentKeys.insert("acronym")
				if let val = exist as? String {
					self.acronym = val
				}
				else {
					errors.append(FHIRJSONError(key: "acronym", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleFor"] {
				presentKeys.insert("exampleFor")
				if let val = exist as? FHIRJSON {
					upsert(exampleFor: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleFor", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["purpose"] {
				presentKeys.insert("purpose")
				if let val = exist as? String {
					self.purpose = val
				}
				else {
					errors.append(FHIRJSONError(key: "purpose", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "purpose"))
			}
			if let exist = js["sourceReference"] {
				presentKeys.insert("sourceReference")
				if let val = exist as? FHIRJSON {
					upsert(sourceReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "sourceReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["sourceUri"] {
				presentKeys.insert("sourceUri")
				if let val = exist as? String {
					self.sourceUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "sourceUri", wants: String.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.sourceUri && nil == self.sourceReference {
				errors.append(FHIRJSONError(key: "source*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let acronym = self.acronym {
			json["acronym"] = acronym.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let exampleFor = self.exampleFor {
			json["exampleFor"] = exampleFor.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let purpose = self.purpose {
			json["purpose"] = purpose.asJSON()
		}
		if let sourceReference = self.sourceReference {
			json["sourceReference"] = sourceReference.asJSON()
		}
		if let sourceUri = self.sourceUri {
			json["sourceUri"] = sourceUri.asJSON()
		}
		
		return json
	}
}


/**
 *  Page/Section in the Guide.
 *
 *  A page / section in the implementation guide. The root page is the implementation guide home page.
 */
open class ImplementationGuidePage: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuidePage" }
	}
    
    public dynamic var format: String?        
        
    public dynamic var kind: String?        
        
    public dynamic var name: String?        
        
    public let package = RealmSwift.List<RealmString>()    
    public let page = RealmSwift.List<ImplementationGuidePage>()    
    public dynamic var source: String?        
        
    public let type = RealmSwift.List<RealmString>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(kind: String, name: String, source: String) {
        self.init(json: nil)
        self.kind = kind
        self.name = name
        self.source = source
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["format"] {
				presentKeys.insert("format")
				if let val = exist as? String {
					self.format = val
				}
				else {
					errors.append(FHIRJSONError(key: "format", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["kind"] {
				presentKeys.insert("kind")
				if let val = exist as? String {
					self.kind = val
				}
				else {
					errors.append(FHIRJSONError(key: "kind", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "kind"))
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "name"))
			}
			if let exist = js["package"] {
				presentKeys.insert("package")
				if let val = exist as? [String] {
					self.package.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "package", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["page"] {
				presentKeys.insert("page")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuidePage.instantiate(fromArray: val, owner: self) as? [ImplementationGuidePage] {
						if let realm = self.realm { realm.delete(self.page) }
						self.page.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "page", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["source"] {
				presentKeys.insert("source")
				if let val = exist as? String {
					self.source = val
				}
				else {
					errors.append(FHIRJSONError(key: "source", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "source"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [String] {
					self.type.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: Array<String>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let format = self.format {
			json["format"] = format.asJSON()
		}
		if let kind = self.kind {
			json["kind"] = kind.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if package.count > 0 {
			json["package"] = Array(package.map() { $0.value })
		}
		if page.count > 0 {
			json["page"] = Array(page.map() { $0.asJSON() })
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		if type.count > 0 {
			json["type"] = Array(type.map() { $0.value })
		}
		
		return json
	}
}

