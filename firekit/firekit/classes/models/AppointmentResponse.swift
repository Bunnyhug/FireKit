//
//  AppointmentResponse.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/AppointmentResponse) on 2017-04-03.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A reply to an appointment request for a patient and/or practitioner(s), such as a confirmation or rejection.
 */
open class AppointmentResponse: DomainResource {
	override open class var resourceType: String {
		get { return "AppointmentResponse" }
	}
    
    public dynamic var actor: Reference?        
    public func upsert(actor: Reference?) {
        upsert(prop: &self.actor, val: actor)
    }    
    public dynamic var appointment: Reference?        
    public func upsert(appointment: Reference?) {
        upsert(prop: &self.appointment, val: appointment)
    }    
    public dynamic var comment: String?        
        
    public dynamic var end: Instant?        
        
    public let identifier = RealmSwift.List<Identifier>()    
    public dynamic var participantStatus: String?        
        
    public let participantType = RealmSwift.List<CodeableConcept>()    
    public dynamic var start: Instant?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(appointment: Reference, participantStatus: String) {
        self.init(json: nil)
        self.appointment = appointment
        self.participantStatus = participantStatus
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["actor"] {
				presentKeys.insert("actor")
				if let val = exist as? FHIRJSON {
					upsert(actor: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "actor", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["appointment"] {
				presentKeys.insert("appointment")
				if let val = exist as? FHIRJSON {
					upsert(appointment: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "appointment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "appointment"))
			}
			if let exist = js["comment"] {
				presentKeys.insert("comment")
				if let val = exist as? String {
					self.comment = val
				}
				else {
					errors.append(FHIRJSONError(key: "comment", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["end"] {
				presentKeys.insert("end")
				if let val = exist as? String {
					self.end = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "end", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Identifier.instantiate(fromArray: val, owner: self) as? [Identifier] {
						if let realm = self.realm { realm.delete(self.identifier) }
						self.identifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["participantStatus"] {
				presentKeys.insert("participantStatus")
				if let val = exist as? String {
					self.participantStatus = val
				}
				else {
					errors.append(FHIRJSONError(key: "participantStatus", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "participantStatus"))
			}
			if let exist = js["participantType"] {
				presentKeys.insert("participantType")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.participantType) }
						self.participantType.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "participantType", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["start"] {
				presentKeys.insert("start")
				if let val = exist as? String {
					self.start = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "start", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let actor = self.actor {
			json["actor"] = actor.asJSON()
		}
		if let appointment = self.appointment {
			json["appointment"] = appointment.asJSON()
		}
		if let comment = self.comment {
			json["comment"] = comment.asJSON()
		}
		if let end = self.end {
			json["end"] = end.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let participantStatus = self.participantStatus {
			json["participantStatus"] = participantStatus.asJSON()
		}
		if participantType.count > 0 {
			json["participantType"] = Array(participantType.map() { $0.asJSON() })
		}
		if let start = self.start {
			json["start"] = start.asJSON()
		}
		
		return json
	}
}

