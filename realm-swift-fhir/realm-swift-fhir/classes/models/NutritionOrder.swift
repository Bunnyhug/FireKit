//
//  NutritionOrder.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/NutritionOrder) on 2017-02-17.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A request for a diet, formula or nutritional supplement.
 *
 *  A request to supply a diet, formula feeding (enteral) or oral nutritional supplement to a patient/resident.
 */
open class NutritionOrder: DomainResource {
	override open class var resourceType: String {
		get { return "NutritionOrder" }
	}

	public let allergyIntolerance = RealmSwift.List<Reference>()
	
	public dynamic var dateTime: DateTime?						
		
		
	
	public dynamic var encounter: Reference?						
		
		
			public func upsert(encounter: Reference?) {
				upsert(prop: &self.encounter, val: encounter)
			}
	
	public dynamic var enteralFormula: NutritionOrderEnteralFormula?						
		
		
			public func upsert(enteralFormula: NutritionOrderEnteralFormula?) {
				upsert(prop: &self.enteralFormula, val: enteralFormula)
			}
	
	public let excludeFoodModifier = RealmSwift.List<CodeableConcept>()
	
	public let foodPreferenceModifier = RealmSwift.List<CodeableConcept>()
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public dynamic var oralDiet: NutritionOrderOralDiet?						
		
		
			public func upsert(oralDiet: NutritionOrderOralDiet?) {
				upsert(prop: &self.oralDiet, val: oralDiet)
			}
	
	public dynamic var orderer: Reference?						
		
		
			public func upsert(orderer: Reference?) {
				upsert(prop: &self.orderer, val: orderer)
			}
	
	public dynamic var patient: Reference?						
		
		
			public func upsert(patient: Reference?) {
				upsert(prop: &self.patient, val: patient)
			}
	
	public dynamic var status: String?						
		
		
	
	public let supplement = RealmSwift.List<NutritionOrderSupplement>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(dateTime: DateTime, patient: Reference) {
		self.init(json: nil)
		self.dateTime = dateTime
		self.patient = patient
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["allergyIntolerance"] {
				presentKeys.insert("allergyIntolerance")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.allergyIntolerance) }
						self.allergyIntolerance.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "allergyIntolerance", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["dateTime"] {
				presentKeys.insert("dateTime")
				if let val = exist as? String {
					self.dateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "dateTime", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "dateTime"))
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
			if let exist = js["enteralFormula"] {
				presentKeys.insert("enteralFormula")
				if let val = exist as? FHIRJSON {
					upsert(enteralFormula: NutritionOrderEnteralFormula(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "enteralFormula", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["excludeFoodModifier"] {
				presentKeys.insert("excludeFoodModifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.excludeFoodModifier) }
						self.excludeFoodModifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "excludeFoodModifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["foodPreferenceModifier"] {
				presentKeys.insert("foodPreferenceModifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.foodPreferenceModifier) }
						self.foodPreferenceModifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "foodPreferenceModifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["oralDiet"] {
				presentKeys.insert("oralDiet")
				if let val = exist as? FHIRJSON {
					upsert(oralDiet: NutritionOrderOralDiet(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "oralDiet", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["orderer"] {
				presentKeys.insert("orderer")
				if let val = exist as? FHIRJSON {
					upsert(orderer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "orderer", wants: FHIRJSON.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "patient"))
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
			if let exist = js["supplement"] {
				presentKeys.insert("supplement")
				if let val = exist as? [FHIRJSON] {
					if let vals = NutritionOrderSupplement.instantiate(fromArray: val, owner: self) as? [NutritionOrderSupplement] {
						if let realm = self.realm { realm.delete(self.supplement) }
						self.supplement.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "supplement", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if allergyIntolerance.count > 0 {
			json["allergyIntolerance"] = Array(allergyIntolerance.map() { $0.asJSON() })
		}
		if let dateTime = self.dateTime {
			json["dateTime"] = dateTime.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if let enteralFormula = self.enteralFormula {
			json["enteralFormula"] = enteralFormula.asJSON()
		}
		if excludeFoodModifier.count > 0 {
			json["excludeFoodModifier"] = Array(excludeFoodModifier.map() { $0.asJSON() })
		}
		if foodPreferenceModifier.count > 0 {
			json["foodPreferenceModifier"] = Array(foodPreferenceModifier.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let oralDiet = self.oralDiet {
			json["oralDiet"] = oralDiet.asJSON()
		}
		if let orderer = self.orderer {
			json["orderer"] = orderer.asJSON()
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if supplement.count > 0 {
			json["supplement"] = Array(supplement.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Enteral formula components.
 *
 *  Feeding provided through the gastrointestinal tract via a tube, catheter, or stoma that delivers nutrition distal to
 *  the oral cavity.
 */
open class NutritionOrderEnteralFormula: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderEnteralFormula" }
	}

	public dynamic var additiveProductName: String?						
		
		
	
	public dynamic var additiveType: CodeableConcept?						
		
		
			public func upsert(additiveType: CodeableConcept?) {
				upsert(prop: &self.additiveType, val: additiveType)
			}
	
	public let administration = RealmSwift.List<NutritionOrderEnteralFormulaAdministration>()
	
	public dynamic var administrationInstruction: String?						
		
		
	
	public dynamic var baseFormulaProductName: String?						
		
		
	
	public dynamic var baseFormulaType: CodeableConcept?						
		
		
			public func upsert(baseFormulaType: CodeableConcept?) {
				upsert(prop: &self.baseFormulaType, val: baseFormulaType)
			}
	
	public dynamic var caloricDensity: Quantity?						
		
		
			public func upsert(caloricDensity: Quantity?) {
				upsert(prop: &self.caloricDensity, val: caloricDensity)
			}
	
	public dynamic var maxVolumeToDeliver: Quantity?						
		
		
			public func upsert(maxVolumeToDeliver: Quantity?) {
				upsert(prop: &self.maxVolumeToDeliver, val: maxVolumeToDeliver)
			}
	
	public dynamic var routeofAdministration: CodeableConcept?						
		
		
			public func upsert(routeofAdministration: CodeableConcept?) {
				upsert(prop: &self.routeofAdministration, val: routeofAdministration)
			}
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["additiveProductName"] {
				presentKeys.insert("additiveProductName")
				if let val = exist as? String {
					self.additiveProductName = val
				}
				else {
					errors.append(FHIRJSONError(key: "additiveProductName", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["additiveType"] {
				presentKeys.insert("additiveType")
				if let val = exist as? FHIRJSON {
					upsert(additiveType: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "additiveType", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["administration"] {
				presentKeys.insert("administration")
				if let val = exist as? [FHIRJSON] {
					if let vals = NutritionOrderEnteralFormulaAdministration.instantiate(fromArray: val, owner: self) as? [NutritionOrderEnteralFormulaAdministration] {
						if let realm = self.realm { realm.delete(self.administration) }
						self.administration.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "administration", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["administrationInstruction"] {
				presentKeys.insert("administrationInstruction")
				if let val = exist as? String {
					self.administrationInstruction = val
				}
				else {
					errors.append(FHIRJSONError(key: "administrationInstruction", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["baseFormulaProductName"] {
				presentKeys.insert("baseFormulaProductName")
				if let val = exist as? String {
					self.baseFormulaProductName = val
				}
				else {
					errors.append(FHIRJSONError(key: "baseFormulaProductName", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["baseFormulaType"] {
				presentKeys.insert("baseFormulaType")
				if let val = exist as? FHIRJSON {
					upsert(baseFormulaType: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "baseFormulaType", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["caloricDensity"] {
				presentKeys.insert("caloricDensity")
				if let val = exist as? FHIRJSON {
					upsert(caloricDensity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "caloricDensity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxVolumeToDeliver"] {
				presentKeys.insert("maxVolumeToDeliver")
				if let val = exist as? FHIRJSON {
					upsert(maxVolumeToDeliver: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxVolumeToDeliver", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["routeofAdministration"] {
				presentKeys.insert("routeofAdministration")
				if let val = exist as? FHIRJSON {
					upsert(routeofAdministration: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "routeofAdministration", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let additiveProductName = self.additiveProductName {
			json["additiveProductName"] = additiveProductName.asJSON()
		}
		if let additiveType = self.additiveType {
			json["additiveType"] = additiveType.asJSON()
		}
		if administration.count > 0 {
			json["administration"] = Array(administration.map() { $0.asJSON() })
		}
		if let administrationInstruction = self.administrationInstruction {
			json["administrationInstruction"] = administrationInstruction.asJSON()
		}
		if let baseFormulaProductName = self.baseFormulaProductName {
			json["baseFormulaProductName"] = baseFormulaProductName.asJSON()
		}
		if let baseFormulaType = self.baseFormulaType {
			json["baseFormulaType"] = baseFormulaType.asJSON()
		}
		if let caloricDensity = self.caloricDensity {
			json["caloricDensity"] = caloricDensity.asJSON()
		}
		if let maxVolumeToDeliver = self.maxVolumeToDeliver {
			json["maxVolumeToDeliver"] = maxVolumeToDeliver.asJSON()
		}
		if let routeofAdministration = self.routeofAdministration {
			json["routeofAdministration"] = routeofAdministration.asJSON()
		}
		
		return json
	}
}


/**
 *  Formula feeding instruction as structured data.
 *
 *  Formula administration instructions as structured data.  This repeating structure allows for changing the
 *  administration rate or volume over time for both bolus and continuous feeding.  An example of this would be an
 *  instruction to increase the rate of continuous feeding every 2 hours.
 */
open class NutritionOrderEnteralFormulaAdministration: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderEnteralFormulaAdministration" }
	}

	public dynamic var quantity: Quantity?						
		
		
			public func upsert(quantity: Quantity?) {
				upsert(prop: &self.quantity, val: quantity)
			}
	
	public dynamic var rateQuantity: Quantity?						
		
		
			public func upsert(rateQuantity: Quantity?) {
				upsert(prop: &self.rateQuantity, val: rateQuantity)
			}
	
	public dynamic var rateRatio: Ratio?						
		
		
			public func upsert(rateRatio: Ratio?) {
				upsert(prop: &self.rateRatio, val: rateRatio)
			}
	
	public dynamic var schedule: Timing?						
		
		
			public func upsert(schedule: Timing?) {
				upsert(prop: &self.schedule, val: schedule)
			}
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? FHIRJSON {
					upsert(quantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "quantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["rateQuantity"] {
				presentKeys.insert("rateQuantity")
				if let val = exist as? FHIRJSON {
					upsert(rateQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "rateQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["rateRatio"] {
				presentKeys.insert("rateRatio")
				if let val = exist as? FHIRJSON {
					upsert(rateRatio: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "rateRatio", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["schedule"] {
				presentKeys.insert("schedule")
				if let val = exist as? FHIRJSON {
					upsert(schedule: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "schedule", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if let rateQuantity = self.rateQuantity {
			json["rateQuantity"] = rateQuantity.asJSON()
		}
		if let rateRatio = self.rateRatio {
			json["rateRatio"] = rateRatio.asJSON()
		}
		if let schedule = self.schedule {
			json["schedule"] = schedule.asJSON()
		}
		
		return json
	}
}


/**
 *  Oral diet components.
 *
 *  Diet given orally in contrast to enteral (tube) feeding.
 */
open class NutritionOrderOralDiet: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderOralDiet" }
	}

	public let fluidConsistencyType = RealmSwift.List<CodeableConcept>()
	
	public dynamic var instruction: String?						
		
		
	
	public let nutrient = RealmSwift.List<NutritionOrderOralDietNutrient>()
	
	public let schedule = RealmSwift.List<Timing>()
	
	public let texture = RealmSwift.List<NutritionOrderOralDietTexture>()
	
	public let type = RealmSwift.List<CodeableConcept>()
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["fluidConsistencyType"] {
				presentKeys.insert("fluidConsistencyType")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.fluidConsistencyType) }
						self.fluidConsistencyType.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "fluidConsistencyType", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["instruction"] {
				presentKeys.insert("instruction")
				if let val = exist as? String {
					self.instruction = val
				}
				else {
					errors.append(FHIRJSONError(key: "instruction", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["nutrient"] {
				presentKeys.insert("nutrient")
				if let val = exist as? [FHIRJSON] {
					if let vals = NutritionOrderOralDietNutrient.instantiate(fromArray: val, owner: self) as? [NutritionOrderOralDietNutrient] {
						if let realm = self.realm { realm.delete(self.nutrient) }
						self.nutrient.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "nutrient", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["schedule"] {
				presentKeys.insert("schedule")
				if let val = exist as? [FHIRJSON] {
					if let vals = Timing.instantiate(fromArray: val, owner: self) as? [Timing] {
						if let realm = self.realm { realm.delete(self.schedule) }
						self.schedule.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "schedule", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["texture"] {
				presentKeys.insert("texture")
				if let val = exist as? [FHIRJSON] {
					if let vals = NutritionOrderOralDietTexture.instantiate(fromArray: val, owner: self) as? [NutritionOrderOralDietTexture] {
						if let realm = self.realm { realm.delete(self.texture) }
						self.texture.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "texture", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.type) }
						self.type.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if fluidConsistencyType.count > 0 {
			json["fluidConsistencyType"] = Array(fluidConsistencyType.map() { $0.asJSON() })
		}
		if let instruction = self.instruction {
			json["instruction"] = instruction.asJSON()
		}
		if nutrient.count > 0 {
			json["nutrient"] = Array(nutrient.map() { $0.asJSON() })
		}
		if schedule.count > 0 {
			json["schedule"] = Array(schedule.map() { $0.asJSON() })
		}
		if texture.count > 0 {
			json["texture"] = Array(texture.map() { $0.asJSON() })
		}
		if type.count > 0 {
			json["type"] = Array(type.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Required  nutrient modifications.
 *
 *  Class that defines the quantity and type of nutrient modifications required for the oral diet.
 */
open class NutritionOrderOralDietNutrient: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderOralDietNutrient" }
	}

	public dynamic var amount: Quantity?						
		
		
			public func upsert(amount: Quantity?) {
				upsert(prop: &self.amount, val: amount)
			}
	
	public dynamic var modifier: CodeableConcept?						
		
		
			public func upsert(modifier: CodeableConcept?) {
				upsert(prop: &self.modifier, val: modifier)
			}
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["amount"] {
				presentKeys.insert("amount")
				if let val = exist as? FHIRJSON {
					upsert(amount: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "amount", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["modifier"] {
				presentKeys.insert("modifier")
				if let val = exist as? FHIRJSON {
					upsert(modifier: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "modifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let amount = self.amount {
			json["amount"] = amount.asJSON()
		}
		if let modifier = self.modifier {
			json["modifier"] = modifier.asJSON()
		}
		
		return json
	}
}


/**
 *  Required  texture modifications.
 *
 *  Class that describes any texture modifications required for the patient to safely consume various types of solid
 *  foods.
 */
open class NutritionOrderOralDietTexture: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderOralDietTexture" }
	}

	public dynamic var foodType: CodeableConcept?						
		
		
			public func upsert(foodType: CodeableConcept?) {
				upsert(prop: &self.foodType, val: foodType)
			}
	
	public dynamic var modifier: CodeableConcept?						
		
		
			public func upsert(modifier: CodeableConcept?) {
				upsert(prop: &self.modifier, val: modifier)
			}
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["foodType"] {
				presentKeys.insert("foodType")
				if let val = exist as? FHIRJSON {
					upsert(foodType: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "foodType", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["modifier"] {
				presentKeys.insert("modifier")
				if let val = exist as? FHIRJSON {
					upsert(modifier: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "modifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let foodType = self.foodType {
			json["foodType"] = foodType.asJSON()
		}
		if let modifier = self.modifier {
			json["modifier"] = modifier.asJSON()
		}
		
		return json
	}
}


/**
 *  Supplement components.
 *
 *  Oral nutritional products given in order to add further nutritional value to the patient's diet.
 */
open class NutritionOrderSupplement: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderSupplement" }
	}

	public dynamic var instruction: String?						
		
		
	
	public dynamic var productName: String?						
		
		
	
	public dynamic var quantity: Quantity?						
		
		
			public func upsert(quantity: Quantity?) {
				upsert(prop: &self.quantity, val: quantity)
			}
	
	public let schedule = RealmSwift.List<Timing>()
	
	public dynamic var type: CodeableConcept?						
		
		
			public func upsert(type: CodeableConcept?) {
				upsert(prop: &self.type, val: type)
			}
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["instruction"] {
				presentKeys.insert("instruction")
				if let val = exist as? String {
					self.instruction = val
				}
				else {
					errors.append(FHIRJSONError(key: "instruction", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["productName"] {
				presentKeys.insert("productName")
				if let val = exist as? String {
					self.productName = val
				}
				else {
					errors.append(FHIRJSONError(key: "productName", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? FHIRJSON {
					upsert(quantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "quantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["schedule"] {
				presentKeys.insert("schedule")
				if let val = exist as? [FHIRJSON] {
					if let vals = Timing.instantiate(fromArray: val, owner: self) as? [Timing] {
						if let realm = self.realm { realm.delete(self.schedule) }
						self.schedule.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "schedule", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		
		if let instruction = self.instruction {
			json["instruction"] = instruction.asJSON()
		}
		if let productName = self.productName {
			json["productName"] = productName.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if schedule.count > 0 {
			json["schedule"] = Array(schedule.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}

