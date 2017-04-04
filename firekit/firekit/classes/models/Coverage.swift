//
//  Coverage.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Coverage) on 2017-04-03.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Insurance or medical plan.
 *
 *  Financial instrument which may be used to pay for or reimburse health care products and services.
 */
open class Coverage: DomainResource {
	override open class var resourceType: String {
		get { return "Coverage" }
	}
    
    public dynamic var bin: Identifier?        
    public func upsert(bin: Identifier?) {
        upsert(prop: &self.bin, val: bin)
    }    
    public let contract = RealmSwift.List<Reference>()    
    public let dependent = RealmOptional<Int>()    
    public dynamic var group: String?        
        
    public let identifier = RealmSwift.List<Identifier>()    
    public dynamic var issuer: Reference?        
    public func upsert(issuer: Reference?) {
        upsert(prop: &self.issuer, val: issuer)
    }    
    public dynamic var network: Identifier?        
    public func upsert(network: Identifier?) {
        upsert(prop: &self.network, val: network)
    }    
    public dynamic var period: Period?        
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }    
    public dynamic var plan: String?        
        
    public let sequence = RealmOptional<Int>()    
    public dynamic var subPlan: String?        
        
    public dynamic var subscriber: Reference?        
    public func upsert(subscriber: Reference?) {
        upsert(prop: &self.subscriber, val: subscriber)
    }    
    public dynamic var subscriberId: Identifier?        
    public func upsert(subscriberId: Identifier?) {
        upsert(prop: &self.subscriberId, val: subscriberId)
    }    
    public dynamic var type: Coding?        
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["bin"] {
				presentKeys.insert("bin")
				if let val = exist as? FHIRJSON {
					upsert(bin: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "bin", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["contract"] {
				presentKeys.insert("contract")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.contract) }
						self.contract.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contract", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["dependent"] {
				presentKeys.insert("dependent")
				if let val = exist as? Int {
					self.dependent.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "dependent", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["group"] {
				presentKeys.insert("group")
				if let val = exist as? String {
					self.group = val
				}
				else {
					errors.append(FHIRJSONError(key: "group", wants: String.self, has: type(of: exist)))
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
			if let exist = js["issuer"] {
				presentKeys.insert("issuer")
				if let val = exist as? FHIRJSON {
					upsert(issuer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "issuer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["network"] {
				presentKeys.insert("network")
				if let val = exist as? FHIRJSON {
					upsert(network: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "network", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["plan"] {
				presentKeys.insert("plan")
				if let val = exist as? String {
					self.plan = val
				}
				else {
					errors.append(FHIRJSONError(key: "plan", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["sequence"] {
				presentKeys.insert("sequence")
				if let val = exist as? Int {
					self.sequence.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequence", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["subPlan"] {
				presentKeys.insert("subPlan")
				if let val = exist as? String {
					self.subPlan = val
				}
				else {
					errors.append(FHIRJSONError(key: "subPlan", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["subscriber"] {
				presentKeys.insert("subscriber")
				if let val = exist as? FHIRJSON {
					upsert(subscriber: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subscriber", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["subscriberId"] {
				presentKeys.insert("subscriberId")
				if let val = exist as? FHIRJSON {
					upsert(subscriberId: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subscriberId", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
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
		
		if let bin = self.bin {
			json["bin"] = bin.asJSON()
		}
		if contract.count > 0 {
			json["contract"] = Array(contract.map() { $0.asJSON() })
		}
		if let dependent = self.dependent.value {
			json["dependent"] = dependent.asJSON()
		}
		if let group = self.group {
			json["group"] = group.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let issuer = self.issuer {
			json["issuer"] = issuer.asJSON()
		}
		if let network = self.network {
			json["network"] = network.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let plan = self.plan {
			json["plan"] = plan.asJSON()
		}
		if let sequence = self.sequence.value {
			json["sequence"] = sequence.asJSON()
		}
		if let subPlan = self.subPlan {
			json["subPlan"] = subPlan.asJSON()
		}
		if let subscriber = self.subscriber {
			json["subscriber"] = subscriber.asJSON()
		}
		if let subscriberId = self.subscriberId {
			json["subscriberId"] = subscriberId.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}

