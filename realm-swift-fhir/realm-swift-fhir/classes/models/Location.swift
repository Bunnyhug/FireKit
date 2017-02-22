//
//  Location.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Location) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Details and position information for a physical place.
 *
 *  Details and position information for a physical place where services are provided  and resources and participants
 *  may be stored, found, contained or accommodated.
 */
open class Location: DomainResource {
	override open class var resourceType: String {
		get { return "Location" }
	}
    
    public dynamic var address: Address?        
    public func upsert(address: Address?) {
        upsert(prop: &self.address, val: address)
    }    
    public dynamic var description_fhir: String?        
        
    public let identifier = RealmSwift.List<Identifier>()    
    public dynamic var managingOrganization: Reference?        
    public func upsert(managingOrganization: Reference?) {
        upsert(prop: &self.managingOrganization, val: managingOrganization)
    }    
    public dynamic var mode: String?        
        
    public dynamic var name: String?        
        
    public dynamic var partOf: Reference?        
    public func upsert(partOf: Reference?) {
        upsert(prop: &self.partOf, val: partOf)
    }    
    public dynamic var physicalType: CodeableConcept?        
    public func upsert(physicalType: CodeableConcept?) {
        upsert(prop: &self.physicalType, val: physicalType)
    }    
    public dynamic var position: LocationPosition?        
    public func upsert(position: LocationPosition?) {
        upsert(prop: &self.position, val: position)
    }    
    public dynamic var status: String?        
        
    public let telecom = RealmSwift.List<ContactPoint>()    
    public dynamic var type: CodeableConcept?        
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["address"] {
				presentKeys.insert("address")
				if let val = exist as? FHIRJSON {
					upsert(address: Address(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "address", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["managingOrganization"] {
				presentKeys.insert("managingOrganization")
				if let val = exist as? FHIRJSON {
					upsert(managingOrganization: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "managingOrganization", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["mode"] {
				presentKeys.insert("mode")
				if let val = exist as? String {
					self.mode = val
				}
				else {
					errors.append(FHIRJSONError(key: "mode", wants: String.self, has: type(of: exist)))
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
			if let exist = js["partOf"] {
				presentKeys.insert("partOf")
				if let val = exist as? FHIRJSON {
					upsert(partOf: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "partOf", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["physicalType"] {
				presentKeys.insert("physicalType")
				if let val = exist as? FHIRJSON {
					upsert(physicalType: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "physicalType", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["position"] {
				presentKeys.insert("position")
				if let val = exist as? FHIRJSON {
					upsert(position: LocationPosition(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "position", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let address = self.address {
			json["address"] = address.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let managingOrganization = self.managingOrganization {
			json["managingOrganization"] = managingOrganization.asJSON()
		}
		if let mode = self.mode {
			json["mode"] = mode.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let partOf = self.partOf {
			json["partOf"] = partOf.asJSON()
		}
		if let physicalType = self.physicalType {
			json["physicalType"] = physicalType.asJSON()
		}
		if let position = self.position {
			json["position"] = position.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  The absolute geographic location.
 *
 *  The absolute geographic location of the Location, expressed using the WGS84 datum (This is the same co-ordinate
 *  system used in KML).
 */
open class LocationPosition: BackboneElement {
	override open class var resourceType: String {
		get { return "LocationPosition" }
	}
    
    public dynamic var altitude: RealmDecimal?        
        
    public dynamic var latitude: RealmDecimal?        
        
    public dynamic var longitude: RealmDecimal?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(latitude: RealmDecimal, longitude: RealmDecimal) {
        self.init(json: nil)
        self.latitude = latitude
        self.longitude = longitude
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["altitude"] {
				presentKeys.insert("altitude")
				if let val = exist as? NSNumber {
					self.altitude = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "altitude", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["latitude"] {
				presentKeys.insert("latitude")
				if let val = exist as? NSNumber {
					self.latitude = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "latitude", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "latitude"))
			}
			if let exist = js["longitude"] {
				presentKeys.insert("longitude")
				if let val = exist as? NSNumber {
					self.longitude = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "longitude", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "longitude"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let altitude = self.altitude {
			json["altitude"] = altitude.asJSON()
		}
		if let latitude = self.latitude {
			json["latitude"] = latitude.asJSON()
		}
		if let longitude = self.longitude {
			json["longitude"] = longitude.asJSON()
		}
		
		return json
	}
}

