//
//  AllergyIntoleranceTests.swift
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


class AllergyIntoleranceTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.AllergyIntolerance {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.AllergyIntolerance {
        // print("Inflating FireKit.AllergyIntolerance from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.AllergyIntolerance.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testAllergyIntolerance1() {   
        var instance: FireKit.AllergyIntolerance?
        do {
            instance = try runAllergyIntolerance1()
            try runAllergyIntolerance1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test AllergyIntolerance successfully, but threw: \(error)")
        }

        testAllergyIntoleranceRealm1(instance!)
    }

    func testAllergyIntolerance1Copying() {
        do {
            let instance = try runAllergyIntolerance1()
            let copy = instance.copy() as? FireKit.AllergyIntolerance
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runAllergyIntolerance1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test AllergyIntolerance successfully, but threw: \(error)")
        }
    }

    func testAllergyIntolerance1Populatability() {
        do {
            let instance = try runAllergyIntolerance1()
            let copy = FireKit.AllergyIntolerance()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runAllergyIntolerance1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test AllergyIntolerance successfully, but threw: \(error)")
        }
    }

    func testAllergyIntoleranceRealm1(_ instance: FireKit.AllergyIntolerance) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runAllergyIntolerance1(JSONEncoder().encode(realm.objects(FireKit.AllergyIntolerance.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.AllergyIntolerance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.AllergyIntolerance.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.AllergyIntolerance()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.AllergyIntolerance.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.AllergyIntolerance.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.AllergyIntolerance.self).count)
    }
    
    @discardableResult
    func runAllergyIntolerance1(_ data: Data? = nil) throws -> FireKit.AllergyIntolerance {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "allergyintolerance-example.json")
        
        XCTAssertEqual(inst.category, "food")
        XCTAssertEqual(inst.criticality, "CRITH")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.identifier[0].system, "http://acme.com/ids/patients/risks")
        XCTAssertEqual(inst.identifier[0].value, "49476534")
        XCTAssertEqual(inst.lastOccurence?.description, "2012-06")
        XCTAssertEqual(inst.patient?.reference, "Patient/example")
        XCTAssertEqual(inst.reaction[0].description_fhir, "Challenge Protocol. Severe Reaction to 1/8 cashew. Epinephrine administered")
        XCTAssertEqual(inst.reaction[0].manifestation[0].coding[0].code, "39579001")
        XCTAssertEqual(inst.reaction[0].manifestation[0].coding[0].display, "Anaphylactic reaction")
        XCTAssertEqual(inst.reaction[0].manifestation[0].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.reaction[0].onset?.description, "2012-06-12")
        XCTAssertEqual(inst.reaction[0].severity, "severe")
        XCTAssertEqual(inst.reaction[0].substance?.coding[0].code, "C3214954")
        XCTAssertEqual(inst.reaction[0].substance?.coding[0].display, "cashew nut allergenic extract Injectable Product")
        XCTAssertEqual(inst.reaction[0].substance?.coding[0].system, "http://www.nlm.nih.gov/research/umls/rxnorm")
        XCTAssertEqual(inst.reaction[1].certainty, "likely")
        XCTAssertEqual(inst.reaction[1].manifestation[0].coding[0].code, "64305001")
        XCTAssertEqual(inst.reaction[1].manifestation[0].coding[0].display, "Urticaria")
        XCTAssertEqual(inst.reaction[1].manifestation[0].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.reaction[1].onset?.description, "2004")
        XCTAssertEqual(inst.reaction[1].severity, "moderate")
        XCTAssertEqual(inst.recordedDate?.description, "2014-10-09T14:58:00+11:00")
        XCTAssertEqual(inst.recorder?.reference, "Practitioner/example")
        XCTAssertEqual(inst.status, "confirmed")
        XCTAssertEqual(inst.substance?.coding[0].code, "227493005")
        XCTAssertEqual(inst.substance?.coding[0].display, "Cashew nuts")
        XCTAssertEqual(inst.substance?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "allergy")

        return inst
    }
}