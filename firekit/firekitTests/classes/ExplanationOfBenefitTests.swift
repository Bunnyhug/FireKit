//
//  ExplanationOfBenefitTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-10-06.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-10-06
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class ExplanationOfBenefitTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.ExplanationOfBenefit {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.ExplanationOfBenefit {
        // print("Inflating FireKit.ExplanationOfBenefit from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.ExplanationOfBenefit.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testExplanationOfBenefit1() {   
        var instance: FireKit.ExplanationOfBenefit?
        do {
            instance = try runExplanationOfBenefit1()
            try runExplanationOfBenefit1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ExplanationOfBenefit successfully, but threw: \(error)")
        }

        testExplanationOfBenefitRealm1(instance!)
    }

    func testExplanationOfBenefit1Copying() {
        do {
            let instance = try runExplanationOfBenefit1()
            let copy = instance.copy() as? FireKit.ExplanationOfBenefit
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runExplanationOfBenefit1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ExplanationOfBenefit successfully, but threw: \(error)")
        }
    }

    func testExplanationOfBenefit1Populatability() {
        do {
            let instance = try runExplanationOfBenefit1()
            let copy = FireKit.ExplanationOfBenefit()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runExplanationOfBenefit1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ExplanationOfBenefit successfully, but threw: \(error)")
        }
    }

    func testExplanationOfBenefitRealm1(_ instance: FireKit.ExplanationOfBenefit) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runExplanationOfBenefit1(JSONEncoder().encode(realm.objects(FireKit.ExplanationOfBenefit.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ExplanationOfBenefit.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ExplanationOfBenefit.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ExplanationOfBenefit()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.ExplanationOfBenefit.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ExplanationOfBenefit.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ExplanationOfBenefit.self).count)
    }
    
    @discardableResult
    func runExplanationOfBenefit1(_ data: Data? = nil) throws -> FireKit.ExplanationOfBenefit {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "explanationofbenefit-example.json")
        
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.disposition, "Claim settled as per contract.")
        XCTAssertEqual(inst.id, "R3500")
        XCTAssertEqual(inst.identifier[0].system, "http://www.BenefitsInc.com/fhir/eob")
        XCTAssertEqual(inst.identifier[0].value, "987654321")
        XCTAssertEqual(inst.organization?.reference, "Organization/2")
        XCTAssertEqual(inst.outcome, "complete")
        XCTAssertEqual(inst.request?.reference, "http://www.BenefitsInc.com/fhir/oralhealthclaim/15476332402")
        XCTAssertEqual(inst.requestOrganization?.reference, "Organization/1")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the ExplanationOfBenefit</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}