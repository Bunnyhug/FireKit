//
//  ProcessResponseTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-22.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-09-22
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class ProcessResponseTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.ProcessResponse {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.ProcessResponse {
        // print("Inflating FireKit.ProcessResponse from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.ProcessResponse.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testProcessResponse1() {   
        var instance: FireKit.ProcessResponse?
        do {
            instance = try runProcessResponse1()
            try runProcessResponse1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcessResponse successfully, but threw: \(error)")
        }

        testProcessResponseRealm1(instance!)
    }

    func testProcessResponse1Copying() {
        do {
            let instance = try runProcessResponse1()
            let copy = instance.copy() as? FireKit.ProcessResponse
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcessResponse1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ProcessResponse successfully, but threw: \(error)")
        }
    }

    func testProcessResponse1Populatability() {
        do {
            let instance = try runProcessResponse1()
            let copy = FireKit.ProcessResponse()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcessResponse1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ProcessResponse successfully, but threw: \(error)")
        }
    }

    func testProcessResponseRealm1(_ instance: FireKit.ProcessResponse) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcessResponse1(JSONEncoder().encode(realm.objects(FireKit.ProcessResponse.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcessResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcessResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcessResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.ProcessResponse.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcessResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcessResponse.self).count)
    }
    
    @discardableResult
    func runProcessResponse1(_ data: Data? = nil) throws -> FireKit.ProcessResponse {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "processresponse-example.json")
        
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.disposition, "Specified coverage is currently in-force.")
        XCTAssertEqual(inst.id, "SR2500")
        XCTAssertEqual(inst.identifier[0].system, "http://www.BenefitsInc.com/fhir/processresponse")
        XCTAssertEqual(inst.identifier[0].value, "881234")
        XCTAssertEqual(inst.organization?.reference, "Organization/2")
        XCTAssertEqual(inst.outcome?.code, "complete")
        XCTAssertEqual(inst.outcome?.system, "http://hl7.org/fhir/processoutcomecodes")
        XCTAssertEqual(inst.request?.reference, "http://www.BenefitsInc.com/fhir/eligibility/225476332402")
        XCTAssertEqual(inst.requestOrganization?.reference, "Organization/1")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the ProcessResponse</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}