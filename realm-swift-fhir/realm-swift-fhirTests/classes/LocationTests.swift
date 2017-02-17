//
//  LocationTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-17.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class LocationTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Location {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Location {
		let instance = RealmSwiftFHIR.Location(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testLocation1() {		
		var instance: RealmSwiftFHIR.Location?
		do {
			instance = try runLocation1()
			try runLocation1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Location
			XCTAssertNotNil(copy)
			try runLocation1(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw")
		}

		testLocationRealm1(instance: instance!)
	}

    func testLocation1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Location = try runLocation1()
            let copy = (instance.copy() as! RealmSwiftFHIR.Location)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location's PKs, but threw: \(error)")
        }
    }

	func testLocationRealm1(instance: RealmSwiftFHIR.Location) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runLocation1(realm.objects(RealmSwiftFHIR.Location.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Location.self).count)
	}
	
	@discardableResult
	func runLocation1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Location {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "location-example-ambulance.json")
		
		XCTAssertEqual(inst.description_fhir, "Ambulance provided by Burgers University Medical Center")
		XCTAssertEqual(inst.id, "amb")
		XCTAssertEqual(inst.managingOrganization?.reference, "Organization/f001")
		XCTAssertEqual(inst.mode, "kind")
		XCTAssertEqual(inst.name, "BUMC Ambulance")
		XCTAssertEqual(inst.physicalType?.coding[0].code, "ve")
		XCTAssertEqual(inst.physicalType?.coding[0].display, "Vehicle")
		XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].use, "mobile")
		XCTAssertEqual(inst.telecom[0].value, "2329")
		XCTAssertEqual(inst.text?.div, "<div>Mobile Clinic</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "AMB")
		XCTAssertEqual(inst.type?.coding[0].display, "Ambulance")
		XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")
		
		return inst
	}
	
	func testLocation2() {		
		var instance: RealmSwiftFHIR.Location?
		do {
			instance = try runLocation2()
			try runLocation2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Location
			XCTAssertNotNil(copy)
			try runLocation2(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw")
		}

		testLocationRealm2(instance: instance!)
	}

    func testLocation2RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Location = try runLocation2()
            let copy = (instance.copy() as! RealmSwiftFHIR.Location)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location's PKs, but threw: \(error)")
        }
    }

	func testLocationRealm2(instance: RealmSwiftFHIR.Location) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runLocation2(realm.objects(RealmSwiftFHIR.Location.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Location.self).count)
	}
	
	@discardableResult
	func runLocation2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Location {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "location-example-hl7hq.json")
		
		XCTAssertEqual(inst.address?.city, "Ann Arbor")
		XCTAssertEqual(inst.address?.country, "USA")
		XCTAssertEqual(inst.address?.line[0].value, "3300 Washtenaw Avenue, Suite 227")
		XCTAssertEqual(inst.address?.postalCode, "48104")
		XCTAssertEqual(inst.address?.state, "MI")
		XCTAssertEqual(inst.description_fhir, "HL7 Headquarters")
		XCTAssertEqual(inst.id, "hl7")
		XCTAssertEqual(inst.mode, "instance")
		XCTAssertEqual(inst.name, "Health Level Seven International")
		XCTAssertEqual(inst.physicalType?.coding[0].code, "bu")
		XCTAssertEqual(inst.physicalType?.coding[0].display, "Building")
		XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
		XCTAssertTrue(inst.position?.latitude! == RealmDecimal(string: "-83.69471"))
		XCTAssertTrue(inst.position?.longitude! == RealmDecimal(string: "42.2565"))
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].value, "(+1) 734-677-7777")
		XCTAssertEqual(inst.telecom[1].system, "fax")
		XCTAssertEqual(inst.telecom[1].value, "(+1) 734-677-6622")
		XCTAssertEqual(inst.telecom[2].system, "email")
		XCTAssertEqual(inst.telecom[2].value, "hq@HL7.org")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "SLEEP")
		XCTAssertEqual(inst.type?.coding[0].display, "Sleep disorders unit")
		XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")
		
		return inst
	}
	
	func testLocation3() {		
		var instance: RealmSwiftFHIR.Location?
		do {
			instance = try runLocation3()
			try runLocation3(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Location
			XCTAssertNotNil(copy)
			try runLocation3(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw")
		}

		testLocationRealm3(instance: instance!)
	}

    func testLocation3RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Location = try runLocation3()
            let copy = (instance.copy() as! RealmSwiftFHIR.Location)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location's PKs, but threw: \(error)")
        }
    }

	func testLocationRealm3(instance: RealmSwiftFHIR.Location) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runLocation3(realm.objects(RealmSwiftFHIR.Location.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Location.self).count)
	}
	
	@discardableResult
	func runLocation3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Location {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "location-example-patients-home.json")
		
		XCTAssertEqual(inst.description_fhir, "Patient's Home")
		XCTAssertEqual(inst.id, "ph")
		XCTAssertEqual(inst.managingOrganization?.reference, "Organization/f001")
		XCTAssertEqual(inst.mode, "kind")
		XCTAssertEqual(inst.name, "Patient's Home")
		XCTAssertEqual(inst.physicalType?.coding[0].code, "ho")
		XCTAssertEqual(inst.physicalType?.coding[0].display, "House")
		XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.div, "<div>Patient's Home</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "PTRES")
		XCTAssertEqual(inst.type?.coding[0].display, "Patient's Residence")
		XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")
		
		return inst
	}
	
	func testLocation4() {		
		var instance: RealmSwiftFHIR.Location?
		do {
			instance = try runLocation4()
			try runLocation4(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Location
			XCTAssertNotNil(copy)
			try runLocation4(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw")
		}

		testLocationRealm4(instance: instance!)
	}

    func testLocation4RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Location = try runLocation4()
            let copy = (instance.copy() as! RealmSwiftFHIR.Location)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location's PKs, but threw: \(error)")
        }
    }

	func testLocationRealm4(instance: RealmSwiftFHIR.Location) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runLocation4(realm.objects(RealmSwiftFHIR.Location.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Location.self).count)
	}
	
	@discardableResult
	func runLocation4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Location {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "location-example-room.json")
		
		XCTAssertEqual(inst.description_fhir, "Old South Wing, Neuro Radiology Operation Room 1 on second floor")
		XCTAssertEqual(inst.id, "2")
		XCTAssertEqual(inst.identifier[0].value, "B1-S.F2.1.00")
		XCTAssertEqual(inst.managingOrganization?.reference, "Organization/f001")
		XCTAssertEqual(inst.mode, "instance")
		XCTAssertEqual(inst.name, "South Wing Neuro OR 1")
		XCTAssertEqual(inst.partOf?.reference, "Location/1")
		XCTAssertEqual(inst.physicalType?.coding[0].code, "ro")
		XCTAssertEqual(inst.physicalType?.coding[0].display, "Room")
		XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
		XCTAssertEqual(inst.status, "suspended")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].value, "2329")
		XCTAssertEqual(inst.text?.div, "<div>Burgers UMC, South Wing, second floor, Neuro Radiology Operation Room 1</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "RNEU")
		XCTAssertEqual(inst.type?.coding[0].display, "Neuroradiology unit")
		XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")
		
		return inst
	}
	
	func testLocation5() {		
		var instance: RealmSwiftFHIR.Location?
		do {
			instance = try runLocation5()
			try runLocation5(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Location
			XCTAssertNotNil(copy)
			try runLocation5(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw")
		}

		testLocationRealm5(instance: instance!)
	}

    func testLocation5RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Location = try runLocation5()
            let copy = (instance.copy() as! RealmSwiftFHIR.Location)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location's PKs, but threw: \(error)")
        }
    }

	func testLocationRealm5(instance: RealmSwiftFHIR.Location) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runLocation5(realm.objects(RealmSwiftFHIR.Location.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Location.self).count)
	}
	
	@discardableResult
	func runLocation5(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Location {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "location-example-ukpharmacy.json")
		
		XCTAssertEqual(inst.description_fhir, "All Pharmacies in the United Kingdom covered by the National Pharmacy Association")
		XCTAssertEqual(inst.id, "ukp")
		XCTAssertEqual(inst.mode, "kind")
		XCTAssertEqual(inst.name, "UK Pharmacies")
		XCTAssertEqual(inst.physicalType?.coding[0].code, "jdn")
		XCTAssertEqual(inst.physicalType?.coding[0].display, "Jurisdiction")
		XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.div, "<div>UK Pharmacies</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "PHARM")
		XCTAssertEqual(inst.type?.coding[0].display, "Pharmacy")
		XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")
		
		return inst
	}
	
	func testLocation6() {		
		var instance: RealmSwiftFHIR.Location?
		do {
			instance = try runLocation6()
			try runLocation6(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Location
			XCTAssertNotNil(copy)
			try runLocation6(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw")
		}

		testLocationRealm6(instance: instance!)
	}

    func testLocation6RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Location = try runLocation6()
            let copy = (instance.copy() as! RealmSwiftFHIR.Location)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location's PKs, but threw: \(error)")
        }
    }

	func testLocationRealm6(instance: RealmSwiftFHIR.Location) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runLocation6(realm.objects(RealmSwiftFHIR.Location.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Location.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runLocation6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Location.self).count)
	}
	
	@discardableResult
	func runLocation6(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Location {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "location-example.json")
		
		XCTAssertEqual(inst.address?.city, "Den Burg")
		XCTAssertEqual(inst.address?.country, "NLD")
		XCTAssertEqual(inst.address?.line[0].value, "Galapagosweg 91, Building A")
		XCTAssertEqual(inst.address?.postalCode, "9105 PZ")
		XCTAssertEqual(inst.address?.use, "work")
		XCTAssertEqual(inst.description_fhir, "Second floor of the Old South Wing, formerly in use by Psychiatry")
		XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/location-alias")
		XCTAssertEqual(inst.extension_fhir[0].valueString, "Burgers University Medical Center, South Wing, second floor")
		XCTAssertEqual(inst.extension_fhir[1].url, "http://hl7.org/fhir/StructureDefinition/location-alias")
		XCTAssertEqual(inst.extension_fhir[1].valueString, "BU MC, SW, F2")
		XCTAssertEqual(inst.id, "1")
		XCTAssertEqual(inst.identifier[0].value, "B1-S.F2")
		XCTAssertEqual(inst.managingOrganization?.reference, "Organization/f001")
		XCTAssertEqual(inst.mode, "instance")
		XCTAssertEqual(inst.name, "South Wing, second floor")
		XCTAssertEqual(inst.physicalType?.coding[0].code, "wi")
		XCTAssertEqual(inst.physicalType?.coding[0].display, "Wing")
		XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
		XCTAssertTrue(inst.position?.altitude! == RealmDecimal(string: "0"))
		XCTAssertTrue(inst.position?.latitude! == RealmDecimal(string: "42.25475478"))
		XCTAssertTrue(inst.position?.longitude! == RealmDecimal(string: "-83.6945691"))
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].use, "work")
		XCTAssertEqual(inst.telecom[0].value, "2328")
		XCTAssertEqual(inst.telecom[1].system, "fax")
		XCTAssertEqual(inst.telecom[1].use, "work")
		XCTAssertEqual(inst.telecom[1].value, "2329")
		XCTAssertEqual(inst.telecom[2].system, "email")
		XCTAssertEqual(inst.telecom[2].value, "second wing admissions")
		XCTAssertEqual(inst.telecom[3].system, "other")
		XCTAssertEqual(inst.telecom[3].use, "work")
		XCTAssertEqual(inst.telecom[3].value, "http://sampleorg.com/southwing")
		XCTAssertEqual(inst.text?.div, "<div>Burgers UMC, South Wing, second floor</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
