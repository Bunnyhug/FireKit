//
//  EpisodeOfCareTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-03-28.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class EpisodeOfCareTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.EpisodeOfCare {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.EpisodeOfCare {
		let instance = RealmSwiftFHIR.EpisodeOfCare(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testEpisodeOfCare1() {		
		var instance: RealmSwiftFHIR.EpisodeOfCare?
		do {
			instance = try runEpisodeOfCare1()
			try runEpisodeOfCare1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.EpisodeOfCare
			XCTAssertNotNil(copy)
			try runEpisodeOfCare1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runEpisodeOfCare1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test EpisodeOfCare successfully, but threw")
		}

		testEpisodeOfCareRealm1(instance: instance!)
	}

    func testEpisodeOfCare1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.EpisodeOfCare = try runEpisodeOfCare1()
            let copy = (instance.copy() as! RealmSwiftFHIR.EpisodeOfCare)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test EpisodeOfCare's PKs, but threw: \(error)")
        }
    }

	func testEpisodeOfCareRealm1(instance: RealmSwiftFHIR.EpisodeOfCare) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runEpisodeOfCare1(realm.objects(RealmSwiftFHIR.EpisodeOfCare.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.EpisodeOfCare.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.EpisodeOfCare.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.EpisodeOfCare()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.EpisodeOfCare.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runEpisodeOfCare1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.EpisodeOfCare.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runEpisodeOfCare1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.EpisodeOfCare.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.EpisodeOfCare.self).count)
	}
	
	@discardableResult
	func runEpisodeOfCare1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.EpisodeOfCare {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "episodeofcare-example.json")
		
		XCTAssertEqual(inst.careManager?.display, "Amanda Assigned")
		XCTAssertEqual(inst.careManager?.reference, "Practitioner/14")
		XCTAssertEqual(inst.careTeam[0].member?.display, "Henry Seven")
		XCTAssertEqual(inst.careTeam[0].member?.reference, "Practitioner/13")
		XCTAssertEqual(inst.careTeam[0].period?.end?.description, "2014-09-16")
		XCTAssertEqual(inst.careTeam[0].period?.start?.description, "2014-09-01")
		XCTAssertEqual(inst.careTeam[0].role[0].coding[0].code, "AO")
		XCTAssertEqual(inst.careTeam[0].role[0].coding[0].display, "Assessment Worker")
		XCTAssertEqual(inst.careTeam[0].role[0].coding[0].system, "http://example.org/EpisodeOfCare/Role")
		XCTAssertEqual(inst.condition[0].display, "Severe burn of left ear")
		XCTAssertEqual(inst.condition[0].reference, "Condition/example")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "http://example.org/sampleepisodeofcare-identifier")
		XCTAssertEqual(inst.identifier[0].value, "123")
		XCTAssertEqual(inst.managingOrganization?.reference, "Organization/hl7")
		XCTAssertEqual(inst.patient?.reference, "Patient/example")
		XCTAssertEqual(inst.period?.start?.description, "2014-09-01")
		XCTAssertEqual(inst.referralRequest[0].display, "Referral from Example Aged Care Services")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.statusHistory[0].period?.end?.description, "2014-09-14")
		XCTAssertEqual(inst.statusHistory[0].period?.start?.description, "2014-09-01")
		XCTAssertEqual(inst.statusHistory[0].status, "planned")
		XCTAssertEqual(inst.statusHistory[1].period?.end?.description, "2014-09-21")
		XCTAssertEqual(inst.statusHistory[1].period?.start?.description, "2014-09-15")
		XCTAssertEqual(inst.statusHistory[1].status, "active")
		XCTAssertEqual(inst.statusHistory[2].period?.end?.description, "2014-09-24")
		XCTAssertEqual(inst.statusHistory[2].period?.start?.description, "2014-09-22")
		XCTAssertEqual(inst.statusHistory[2].status, "onhold")
		XCTAssertEqual(inst.statusHistory[3].period?.start?.description, "2014-09-25")
		XCTAssertEqual(inst.statusHistory[3].status, "active")
		XCTAssertEqual(inst.text?.div, "<div>\n      HACC Program for Peter James Chalmers at HL7 Healthcare 15 Sept 2014 - current<br/>\n\t\t\twas on leave from 22 Sept - 24 Sept while in respite care\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type[0].coding[0].code, "HACC")
		XCTAssertEqual(inst.type[0].coding[0].display, "Home and Community Care Package")
		XCTAssertEqual(inst.type[0].coding[0].system, "http://example.org/EpisodeOfCare/Type")
		
		return inst
	}
}
