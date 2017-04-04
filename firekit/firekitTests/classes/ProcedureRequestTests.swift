//
//  ProcedureRequestTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-04-03.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class ProcedureRequestTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> FireKit.ProcedureRequest {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> FireKit.ProcedureRequest {
		let instance = FireKit.ProcedureRequest(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testProcedureRequest1() {		
		var instance: FireKit.ProcedureRequest?
		do {
			instance = try runProcedureRequest1()
			try runProcedureRequest1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.ProcedureRequest
			XCTAssertNotNil(copy)
			try runProcedureRequest1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runProcedureRequest1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ProcedureRequest successfully, but threw")
		}

		testProcedureRequestRealm1(instance: instance!)
	}

    func testProcedureRequest1RealmPK() {        
        do {
            let instance: FireKit.ProcedureRequest = try runProcedureRequest1()
            let copy = (instance.copy() as! FireKit.ProcedureRequest)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcedureRequest's PKs, but threw: \(error)")
        }
    }

	func testProcedureRequestRealm1(instance: FireKit.ProcedureRequest) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runProcedureRequest1(realm.objects(FireKit.ProcedureRequest.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcedureRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcedureRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcedureRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ProcedureRequest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runProcedureRequest1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ProcedureRequest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runProcedureRequest1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcedureRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcedureRequest.self).count)
	}
	
	@discardableResult
	func runProcedureRequest1(_ json: FHIRJSON? = nil) throws -> FireKit.ProcedureRequest {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "procedurerequest-example.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "323418000")
		XCTAssertEqual(inst.code?.coding[0].display, "Fix me up")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>To be added</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
