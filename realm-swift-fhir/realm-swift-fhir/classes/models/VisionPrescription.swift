//
//  VisionPrescription.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/VisionPrescription) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Prescription for vision correction products for a patient.
 *
 *  An authorization for the supply of glasses and/or contact lenses to a patient.
 */
open class VisionPrescription: DomainResource {
	override open class var resourceType: String {
		get { return "VisionPrescription" }
	}
    
    public dynamic var dateWritten: DateTime?        
        
    public let dispense = RealmSwift.List<VisionPrescriptionDispense>()    
    public dynamic var encounter: Reference?        
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }    
    public let identifier = RealmSwift.List<Identifier>()    
    public dynamic var patient: Reference?        
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }    
    public dynamic var prescriber: Reference?        
    public func upsert(prescriber: Reference?) {
        upsert(prop: &self.prescriber, val: prescriber)
    }    
    public dynamic var reasonCodeableConcept: CodeableConcept?        
    public func upsert(reasonCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.reasonCodeableConcept, val: reasonCodeableConcept)
    }    
    public dynamic var reasonReference: Reference?        
    public func upsert(reasonReference: Reference?) {
        upsert(prop: &self.reasonReference, val: reasonReference)
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["dateWritten"] {
				presentKeys.insert("dateWritten")
				if let val = exist as? String {
					self.dateWritten = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "dateWritten", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["dispense"] {
				presentKeys.insert("dispense")
				if let val = exist as? [FHIRJSON] {
					if let vals = VisionPrescriptionDispense.instantiate(fromArray: val, owner: self) as? [VisionPrescriptionDispense] {
						if let realm = self.realm { realm.delete(self.dispense) }
						self.dispense.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "dispense", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					upsert(encounter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["patient"] {
				presentKeys.insert("patient")
				if let val = exist as? FHIRJSON {
					upsert(patient: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patient", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["prescriber"] {
				presentKeys.insert("prescriber")
				if let val = exist as? FHIRJSON {
					upsert(prescriber: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "prescriber", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonCodeableConcept"] {
				presentKeys.insert("reasonCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(reasonCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reasonCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonReference"] {
				presentKeys.insert("reasonReference")
				if let val = exist as? FHIRJSON {
					upsert(reasonReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reasonReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let dateWritten = self.dateWritten {
			json["dateWritten"] = dateWritten.asJSON()
		}
		if dispense.count > 0 {
			json["dispense"] = Array(dispense.map() { $0.asJSON() })
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let prescriber = self.prescriber {
			json["prescriber"] = prescriber.asJSON()
		}
		if let reasonCodeableConcept = self.reasonCodeableConcept {
			json["reasonCodeableConcept"] = reasonCodeableConcept.asJSON()
		}
		if let reasonReference = self.reasonReference {
			json["reasonReference"] = reasonReference.asJSON()
		}
		
		return json
	}
}


/**
 *  Vision supply authorization.
 *
 *  Deals with details of the dispense part of the supply specification.
 */
open class VisionPrescriptionDispense: BackboneElement {
	override open class var resourceType: String {
		get { return "VisionPrescriptionDispense" }
	}
    
    public dynamic var add: RealmDecimal?        
        
    public let axis = RealmOptional<Int>()    
    public dynamic var backCurve: RealmDecimal?        
        
    public dynamic var base: String?        
        
    public dynamic var brand: String?        
        
    public dynamic var color: String?        
        
    public dynamic var cylinder: RealmDecimal?        
        
    public dynamic var diameter: RealmDecimal?        
        
    public dynamic var duration: Quantity?        
    public func upsert(duration: Quantity?) {
        upsert(prop: &self.duration, val: duration)
    }    
    public dynamic var eye: String?        
        
    public dynamic var notes: String?        
        
    public dynamic var power: RealmDecimal?        
        
    public dynamic var prism: RealmDecimal?        
        
    public dynamic var product: Coding?        
    public func upsert(product: Coding?) {
        upsert(prop: &self.product, val: product)
    }    
    public dynamic var sphere: RealmDecimal?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(product: Coding) {
        self.init(json: nil)
        self.product = product
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["add"] {
				presentKeys.insert("add")
				if let val = exist as? NSNumber {
					self.add = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "add", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["axis"] {
				presentKeys.insert("axis")
				if let val = exist as? Int {
					self.axis.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "axis", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["backCurve"] {
				presentKeys.insert("backCurve")
				if let val = exist as? NSNumber {
					self.backCurve = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "backCurve", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["base"] {
				presentKeys.insert("base")
				if let val = exist as? String {
					self.base = val
				}
				else {
					errors.append(FHIRJSONError(key: "base", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["brand"] {
				presentKeys.insert("brand")
				if let val = exist as? String {
					self.brand = val
				}
				else {
					errors.append(FHIRJSONError(key: "brand", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["color"] {
				presentKeys.insert("color")
				if let val = exist as? String {
					self.color = val
				}
				else {
					errors.append(FHIRJSONError(key: "color", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["cylinder"] {
				presentKeys.insert("cylinder")
				if let val = exist as? NSNumber {
					self.cylinder = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "cylinder", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["diameter"] {
				presentKeys.insert("diameter")
				if let val = exist as? NSNumber {
					self.diameter = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "diameter", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["duration"] {
				presentKeys.insert("duration")
				if let val = exist as? FHIRJSON {
					upsert(duration: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "duration", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["eye"] {
				presentKeys.insert("eye")
				if let val = exist as? String {
					self.eye = val
				}
				else {
					errors.append(FHIRJSONError(key: "eye", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["notes"] {
				presentKeys.insert("notes")
				if let val = exist as? String {
					self.notes = val
				}
				else {
					errors.append(FHIRJSONError(key: "notes", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["power"] {
				presentKeys.insert("power")
				if let val = exist as? NSNumber {
					self.power = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "power", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["prism"] {
				presentKeys.insert("prism")
				if let val = exist as? NSNumber {
					self.prism = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "prism", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["product"] {
				presentKeys.insert("product")
				if let val = exist as? FHIRJSON {
					upsert(product: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "product", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "product"))
			}
			if let exist = js["sphere"] {
				presentKeys.insert("sphere")
				if let val = exist as? NSNumber {
					self.sphere = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "sphere", wants: NSNumber.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let add = self.add {
			json["add"] = add.asJSON()
		}
		if let axis = self.axis.value {
			json["axis"] = axis.asJSON()
		}
		if let backCurve = self.backCurve {
			json["backCurve"] = backCurve.asJSON()
		}
		if let base = self.base {
			json["base"] = base.asJSON()
		}
		if let brand = self.brand {
			json["brand"] = brand.asJSON()
		}
		if let color = self.color {
			json["color"] = color.asJSON()
		}
		if let cylinder = self.cylinder {
			json["cylinder"] = cylinder.asJSON()
		}
		if let diameter = self.diameter {
			json["diameter"] = diameter.asJSON()
		}
		if let duration = self.duration {
			json["duration"] = duration.asJSON()
		}
		if let eye = self.eye {
			json["eye"] = eye.asJSON()
		}
		if let notes = self.notes {
			json["notes"] = notes.asJSON()
		}
		if let power = self.power {
			json["power"] = power.asJSON()
		}
		if let prism = self.prism {
			json["prism"] = prism.asJSON()
		}
		if let product = self.product {
			json["product"] = product.asJSON()
		}
		if let sphere = self.sphere {
			json["sphere"] = sphere.asJSON()
		}
		
		return json
	}
}

