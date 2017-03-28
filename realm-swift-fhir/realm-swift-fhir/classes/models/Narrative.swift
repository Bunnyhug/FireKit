//
//  Narrative.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Narrative) on 2017-03-28.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A human-readable formatted text, including images.
 */
open class Narrative: Element {
	override open class var resourceType: String {
		get { return "Narrative" }
	}
    
    public dynamic var div: String?        
        
    public dynamic var status: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(div: String, status: String) {
        self.init(json: nil)
        self.div = div
        self.status = status
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["div"] {
				presentKeys.insert("div")
				if let val = exist as? String {
					self.div = val
				}
				else {
					errors.append(FHIRJSONError(key: "div", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "div"))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let div = self.div {
			json["div"] = div.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		
		return json
	}
}

