//
//  RelatedPersonTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class RelatedPersonTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.RelatedPerson {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.RelatedPerson {
		let instance = RealmSwiftFHIR.RelatedPerson(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testRelatedPerson1() {		
		var instance: RealmSwiftFHIR.RelatedPerson?
		do {
			instance = try runRelatedPerson1()
			try runRelatedPerson1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test RelatedPerson successfully, but threw")
		}

		testRelatedPersonRealm1(instance: instance!)
	}

	func testRelatedPersonRealm1(instance: RealmSwiftFHIR.RelatedPerson) {
		try! realm.write {
                realm.add(instance)
            }
        try! runRelatedPerson1(realm.objects(RealmSwiftFHIR.RelatedPerson.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.RelatedPerson.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.RelatedPerson.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runRelatedPerson1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.RelatedPerson {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "relatedperson-example-f001-sarah.json")
		
		XCTAssertEqual(inst.gender, "female")
		XCTAssertEqual(inst.id, "f001")
		XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
		XCTAssertEqual(inst.identifier[0].type?.text, "BSN")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.name?.family[0].value, "Abels")
		XCTAssertEqual(inst.name?.given[0].value, "Sarah")
		XCTAssertEqual(inst.name?.use, "usual")
		XCTAssertEqual(inst.patient?.reference, "Patient/f001")
		XCTAssertEqual(inst.relationship?.coding[0].code, "SIGOTHR")
		XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].use, "mobile")
		XCTAssertEqual(inst.telecom[0].value, "0690383372")
		XCTAssertEqual(inst.telecom[1].system, "email")
		XCTAssertEqual(inst.telecom[1].use, "home")
		XCTAssertEqual(inst.telecom[1].value, "s.abels@kpn.nl")
		XCTAssertEqual(inst.text?.div, "<div>\n     Sarah Abels\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testRelatedPerson2() {		
		var instance: RealmSwiftFHIR.RelatedPerson?
		do {
			instance = try runRelatedPerson2()
			try runRelatedPerson2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test RelatedPerson successfully, but threw")
		}

		testRelatedPersonRealm2(instance: instance!)
	}

	func testRelatedPersonRealm2(instance: RealmSwiftFHIR.RelatedPerson) {
		try! realm.write {
                realm.add(instance)
            }
        try! runRelatedPerson2(realm.objects(RealmSwiftFHIR.RelatedPerson.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.RelatedPerson.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.RelatedPerson.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runRelatedPerson2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.RelatedPerson {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "relatedperson-example-f002-ariadne.json")
		
		XCTAssertEqual(inst.birthDate?.description, "1963")
		XCTAssertEqual(inst.gender, "female")
		XCTAssertEqual(inst.id, "f002")
		XCTAssertEqual(inst.name?.text, "Ariadne Bor-Jansma")
		XCTAssertEqual(inst.name?.use, "usual")
		XCTAssertEqual(inst.patient?.reference, "Patient/f201")
		XCTAssertEqual(inst.period?.start?.description, "1975")
		XCTAssertEqual(inst.photo[0].contentType, "image/jpeg")
		XCTAssertEqual(inst.relationship?.coding[0].code, "SIGOTHR")
		XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].use, "home")
		XCTAssertEqual(inst.telecom[0].value, "+31201234567")
		XCTAssertEqual(inst.text?.div, "<div>\n     Ariadne Bor-Jansma\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testRelatedPerson3() {		
		var instance: RealmSwiftFHIR.RelatedPerson?
		do {
			instance = try runRelatedPerson3()
			try runRelatedPerson3(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test RelatedPerson successfully, but threw")
		}

		testRelatedPersonRealm3(instance: instance!)
	}

	func testRelatedPersonRealm3(instance: RealmSwiftFHIR.RelatedPerson) {
		try! realm.write {
                realm.add(instance)
            }
        try! runRelatedPerson3(realm.objects(RealmSwiftFHIR.RelatedPerson.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.RelatedPerson.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.RelatedPerson.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runRelatedPerson3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.RelatedPerson {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "relatedperson-example-peter.json")
		
		XCTAssertEqual(inst.address[0].city, "PleasantVille")
		XCTAssertEqual(inst.address[0].line[0].value, "534 Erewhon St")
		XCTAssertEqual(inst.address[0].postalCode, "3999")
		XCTAssertEqual(inst.address[0].state, "Vic")
		XCTAssertEqual(inst.address[0].use, "home")
		XCTAssertEqual(inst.gender, "male")
		XCTAssertEqual(inst.id, "peter")
		XCTAssertEqual(inst.name?.family[0].value, "Chalmers")
		XCTAssertEqual(inst.name?.given[0].value, "Peter")
		XCTAssertEqual(inst.name?.given[1].value, "James")
		XCTAssertEqual(inst.name?.use, "official")
		XCTAssertEqual(inst.patient?.reference, "Patient/animal")
		XCTAssertEqual(inst.period?.start?.description, "2012-03-11")
		XCTAssertEqual(inst.photo[0].contentType, "image/jpeg")
		XCTAssertEqual(inst.photo[0].url, "Binary/f012")
		XCTAssertEqual(inst.relationship?.coding[0].code, "owner")
		XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/patient-contact-relationship")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].use, "work")
		XCTAssertEqual(inst.telecom[0].value, "(03) 5555 6473")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testRelatedPerson4() {		
		var instance: RealmSwiftFHIR.RelatedPerson?
		do {
			instance = try runRelatedPerson4()
			try runRelatedPerson4(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test RelatedPerson successfully, but threw")
		}

		testRelatedPersonRealm4(instance: instance!)
	}

	func testRelatedPersonRealm4(instance: RealmSwiftFHIR.RelatedPerson) {
		try! realm.write {
                realm.add(instance)
            }
        try! runRelatedPerson4(realm.objects(RealmSwiftFHIR.RelatedPerson.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.RelatedPerson.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.RelatedPerson.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runRelatedPerson4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.RelatedPerson {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "relatedperson-example.json")
		
		XCTAssertEqual(inst.address[0].city, "Paris")
		XCTAssertEqual(inst.address[0].country, "FRA")
		XCTAssertEqual(inst.address[0].postalCode, "75004")
		XCTAssertEqual(inst.gender, "female")
		XCTAssertEqual(inst.id, "benedicte")
		XCTAssertEqual(inst.identifier[0].system, "urn:oid:1.2.250.1.61")
		XCTAssertEqual(inst.identifier[0].type?.text, "INSEE")
		XCTAssertEqual(inst.identifier[0].use, "usual")
		XCTAssertEqual(inst.identifier[0].value, "272117510400399")
		XCTAssertEqual(inst.name?.family[0].value, "du")
		XCTAssertEqual(inst.patient?.reference, "Patient/example")
		XCTAssertEqual(inst.photo[0].contentType, "image/jpeg")
		XCTAssertEqual(inst.photo[0].url, "Binary/f016")
		XCTAssertEqual(inst.relationship?.coding[0].code, "partner")
		XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/patient-contact-relationship")
		XCTAssertEqual(inst.relationship?.coding[1].code, "WIFE")
		XCTAssertEqual(inst.relationship?.coding[1].system, "http://hl7.org/fhir/v3/RoleCode")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].value, "+33 (237) 998327")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
