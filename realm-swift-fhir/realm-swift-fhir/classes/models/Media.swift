//
//  Media.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Media) on 2017-02-01.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A photo, video, or audio recording acquired or used in healthcare. The actual content may be inline or provided by
 *  direct reference.
 */
open class Media: DomainResource {
	override open class var resourceType: String {
		get { return "Media" }
	}

	public dynamic var content: Attachment?
	
	public dynamic var deviceName: String?
	
	public let duration = RealmOptional<Int>()
	
	public let frames = RealmOptional<Int>()
	
	public let height = RealmOptional<Int>()
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public dynamic var operator_fhir: Reference?
	
	public dynamic var subject: Reference?
	
	public dynamic var subtype: CodeableConcept?
	
	public dynamic var type: String?
	
	public dynamic var view: CodeableConcept?
	
	public let width = RealmOptional<Int>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(content: Attachment, type: String) {
		self.init(json: nil)
		self.content = content
		self.type = type
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["content"] {
				presentKeys.insert("content")
				if let val = exist as? FHIRJSON {
					self.content = Attachment(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "content", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "content"))
			}
			if let exist = js["deviceName"] {
				presentKeys.insert("deviceName")
				if let val = exist as? String {
					self.deviceName = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "deviceName", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["duration"] {
				presentKeys.insert("duration")
				if let val = exist as? Int {
					self.duration.value = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "duration", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["frames"] {
				presentKeys.insert("frames")
				if let val = exist as? Int {
					self.frames.value = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "frames", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["height"] {
				presentKeys.insert("height")
				if let val = exist as? Int {
					self.height.value = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "height", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Identifier.instantiate(fromArray: val, owner: self) as? [Identifier] {
						self.identifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["operator"] {
				presentKeys.insert("operator")
				if let val = exist as? FHIRJSON {
					self.operator_fhir = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "operator", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					self.subject = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["subtype"] {
				presentKeys.insert("subtype")
				if let val = exist as? FHIRJSON {
					self.subtype = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "subtype", wants: FHIRJSON.self, has: type(of: exist)))
				}
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
			if let exist = js["view"] {
				presentKeys.insert("view")
				if let val = exist as? FHIRJSON {
					self.view = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "view", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["width"] {
				presentKeys.insert("width")
				if let val = exist as? Int {
					self.width.value = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "width", wants: Int.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let content = self.content {
			json["content"] = content.asJSON()
		}
		if let deviceName = self.deviceName {
			json["deviceName"] = deviceName.asJSON()
		}
		if let duration = self.duration.value {
			json["duration"] = duration.asJSON()
		}
		if let frames = self.frames.value {
			json["frames"] = frames.asJSON()
		}
		if let height = self.height.value {
			json["height"] = height.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let operator_fhir = self.operator_fhir {
			json["operator"] = operator_fhir.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		if let subtype = self.subtype {
			json["subtype"] = subtype.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let view = self.view {
			json["view"] = view.asJSON()
		}
		if let width = self.width.value {
			json["width"] = width.asJSON()
		}
		
		return json
	}
}

