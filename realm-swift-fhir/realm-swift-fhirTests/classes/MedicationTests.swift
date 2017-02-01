//
//  MedicationTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class MedicationTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Medication {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Medication {
		let instance = RealmSwiftFHIR.Medication(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testMedication1() {		
		var instance: RealmSwiftFHIR.Medication?
		do {
			instance = try runMedication1()
			try runMedication1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm1(instance: instance!)
	}

	func testMedicationRealm1(instance: RealmSwiftFHIR.Medication) {
		try! realm.write {
                realm.add(instance)
            }
        try! runMedication1(realm.objects(RealmSwiftFHIR.Medication.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Medication.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runMedication1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Medication {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "medication-example-f001-combivent.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "320442002")
		XCTAssertEqual(inst.code?.coding[0].display, "Salbutamol+ipratropium bromide 100micrograms/20micrograms inhaler")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f001")
		XCTAssertTrue(inst.isBrand.value ?? false)
		XCTAssertEqual(inst.product?.form?.coding[0].code, "420317006")
		XCTAssertEqual(inst.product?.form?.coding[0].display, "Inhaler (qualifier value)")
		XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
		XCTAssertTrue(inst.product?.ingredient[0].amount?.denominator?.value! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.code, "ml")
		XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.unit, "ml")
		XCTAssertTrue(inst.product?.ingredient[0].amount?.numerator?.value! == RealmDecimal(string: "100"))
		XCTAssertEqual(inst.product?.ingredient[0].item?.display, "Combivent")
		XCTAssertEqual(inst.product?.ingredient[0].item?.reference, "Medication/f001")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication2() {		
		var instance: RealmSwiftFHIR.Medication?
		do {
			instance = try runMedication2()
			try runMedication2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm2(instance: instance!)
	}

	func testMedicationRealm2(instance: RealmSwiftFHIR.Medication) {
		try! realm.write {
                realm.add(instance)
            }
        try! runMedication2(realm.objects(RealmSwiftFHIR.Medication.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Medication.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runMedication2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Medication {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "medication-example-f002-crestor.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "408036003")
		XCTAssertEqual(inst.code?.coding[0].display, "Rosuvastatin 10mg tablet")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f002")
		XCTAssertTrue(inst.isBrand.value ?? false)
		XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
		XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
		XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication3() {		
		var instance: RealmSwiftFHIR.Medication?
		do {
			instance = try runMedication3()
			try runMedication3(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm3(instance: instance!)
	}

	func testMedicationRealm3(instance: RealmSwiftFHIR.Medication) {
		try! realm.write {
                realm.add(instance)
            }
        try! runMedication3(realm.objects(RealmSwiftFHIR.Medication.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Medication.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runMedication3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Medication {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "medication-example-f003-tolbutamide.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "325267004")
		XCTAssertEqual(inst.code?.coding[0].display, "Tolbutamide 500mg tablet")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f003")
		XCTAssertTrue(inst.isBrand.value ?? false)
		XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
		XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
		XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication4() {		
		var instance: RealmSwiftFHIR.Medication?
		do {
			instance = try runMedication4()
			try runMedication4(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm4(instance: instance!)
	}

	func testMedicationRealm4(instance: RealmSwiftFHIR.Medication) {
		try! realm.write {
                realm.add(instance)
            }
        try! runMedication4(realm.objects(RealmSwiftFHIR.Medication.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Medication.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runMedication4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Medication {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "medication-example-f004-metoprolol.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "318475005")
		XCTAssertEqual(inst.code?.coding[0].display, "Metoprolol tartrate 50mg tablet")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f004")
		XCTAssertTrue(inst.isBrand.value ?? false)
		XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
		XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
		XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication5() {		
		var instance: RealmSwiftFHIR.Medication?
		do {
			instance = try runMedication5()
			try runMedication5(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm5(instance: instance!)
	}

	func testMedicationRealm5(instance: RealmSwiftFHIR.Medication) {
		try! realm.write {
                realm.add(instance)
            }
        try! runMedication5(realm.objects(RealmSwiftFHIR.Medication.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Medication.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runMedication5(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Medication {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "medication-example-f005-enalapril.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "318851002")
		XCTAssertEqual(inst.code?.coding[0].display, "Enalapril maleate 5mg tablet")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f005")
		XCTAssertTrue(inst.isBrand.value ?? false)
		XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
		XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
		XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication6() {		
		var instance: RealmSwiftFHIR.Medication?
		do {
			instance = try runMedication6()
			try runMedication6(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm6(instance: instance!)
	}

	func testMedicationRealm6(instance: RealmSwiftFHIR.Medication) {
		try! realm.write {
                realm.add(instance)
            }
        try! runMedication6(realm.objects(RealmSwiftFHIR.Medication.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Medication.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runMedication6(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Medication {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "medication-example-f201-salmeterol.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "411106009")
		XCTAssertEqual(inst.code?.coding[0].display, "25ug Flutacisone + 250ug Salmeterol")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f201")
		XCTAssertFalse(inst.isBrand.value ?? true)
		XCTAssertEqual(inst.product?.form?.coding[0].code, "421606006")
		XCTAssertEqual(inst.product?.form?.coding[0].display, "Aerosol spray")
		XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.product?.ingredient[0].amount?.denominator?.code, "PUFF")
		XCTAssertEqual(inst.product?.ingredient[0].amount?.denominator?.system, "http://hl7.org/fhir/v3/orderableDrugForm")
		XCTAssertTrue(inst.product?.ingredient[0].amount?.denominator?.value! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.code, "ug")
		XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.system, "http://unitsofmeasure.org")
		XCTAssertTrue(inst.product?.ingredient[0].amount?.numerator?.value! == RealmDecimal(string: "25"))
		XCTAssertEqual(inst.product?.ingredient[0].item?.display, "flutacisone")
		XCTAssertEqual(inst.product?.ingredient[1].amount?.denominator?.code, "PUFF")
		XCTAssertEqual(inst.product?.ingredient[1].amount?.denominator?.system, "http://hl7.org/fhir/v3/orderableDrugForm")
		XCTAssertTrue(inst.product?.ingredient[1].amount?.denominator?.value! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.product?.ingredient[1].amount?.numerator?.code, "ug")
		XCTAssertEqual(inst.product?.ingredient[1].amount?.numerator?.system, "http://unitsofmeasure.org")
		XCTAssertTrue(inst.product?.ingredient[1].amount?.numerator?.value! == RealmDecimal(string: "250"))
		XCTAssertEqual(inst.product?.ingredient[1].item?.display, "salmeterol")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication7() {		
		var instance: RealmSwiftFHIR.Medication?
		do {
			instance = try runMedication7()
			try runMedication7(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm7(instance: instance!)
	}

	func testMedicationRealm7(instance: RealmSwiftFHIR.Medication) {
		try! realm.write {
                realm.add(instance)
            }
        try! runMedication7(realm.objects(RealmSwiftFHIR.Medication.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Medication.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runMedication7(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Medication {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "medication-example-f202-flucloxacilline.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "387544009")
		XCTAssertEqual(inst.code?.coding[0].display, "Flucloxacillin")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f202")
		XCTAssertFalse(inst.isBrand.value ?? true)
		XCTAssertEqual(inst.product?.form?.coding[0].code, "385218009")
		XCTAssertEqual(inst.product?.form?.coding[0].display, "Injection")
		XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication8() {		
		var instance: RealmSwiftFHIR.Medication?
		do {
			instance = try runMedication8()
			try runMedication8(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm8(instance: instance!)
	}

	func testMedicationRealm8(instance: RealmSwiftFHIR.Medication) {
		try! realm.write {
                realm.add(instance)
            }
        try! runMedication8(realm.objects(RealmSwiftFHIR.Medication.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Medication.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runMedication8(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Medication {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "medication-example-f203-paracetamol.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "387517004")
		XCTAssertEqual(inst.code?.coding[0].display, "Paracetamol")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f203")
		XCTAssertFalse(inst.isBrand.value ?? true)
		XCTAssertEqual(inst.product?.form?.coding[0].code, "385055001")
		XCTAssertEqual(inst.product?.form?.coding[0].display, "Tablet")
		XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
