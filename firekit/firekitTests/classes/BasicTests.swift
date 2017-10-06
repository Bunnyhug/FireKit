//
//  BasicTests.swift
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


class BasicTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Basic {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Basic {
        // print("Inflating FireKit.Basic from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Basic.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testBasic1() {   
        var instance: FireKit.Basic?
        do {
            instance = try runBasic1()
            try runBasic1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Basic successfully, but threw: \(error)")
        }

        testBasicRealm1(instance!)
    }

    func testBasic1Copying() {
        do {
            let instance = try runBasic1()
            let copy = instance.copy() as? FireKit.Basic
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBasic1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Basic successfully, but threw: \(error)")
        }
    }

    func testBasic1Populatability() {
        do {
            let instance = try runBasic1()
            let copy = FireKit.Basic()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBasic1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Basic successfully, but threw: \(error)")
        }
    }

    func testBasicRealm1(_ instance: FireKit.Basic) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBasic1(JSONEncoder().encode(realm.objects(FireKit.Basic.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Basic.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Basic.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Basic()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Basic.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Basic.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Basic.self).count)
    }
    
    @discardableResult
    func runBasic1(_ data: Data? = nil) throws -> FireKit.Basic {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "basic-example-narrative.json")
        
        XCTAssertEqual(inst.code?.text, "Example Narrative Tester")
        XCTAssertEqual(inst.id, "basic-example-narrative")
        XCTAssertEqual(inst.text?.status, "additional")

        return inst
    }
    
    func testBasic2() {   
        var instance: FireKit.Basic?
        do {
            instance = try runBasic2()
            try runBasic2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Basic successfully, but threw: \(error)")
        }

        testBasicRealm2(instance!)
    }

    func testBasic2Copying() {
        do {
            let instance = try runBasic2()
            let copy = instance.copy() as? FireKit.Basic
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBasic2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Basic successfully, but threw: \(error)")
        }
    }

    func testBasic2Populatability() {
        do {
            let instance = try runBasic2()
            let copy = FireKit.Basic()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBasic2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Basic successfully, but threw: \(error)")
        }
    }

    func testBasicRealm2(_ instance: FireKit.Basic) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBasic2(JSONEncoder().encode(realm.objects(FireKit.Basic.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Basic.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Basic.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Basic()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Basic.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Basic.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Basic.self).count)
    }
    
    @discardableResult
    func runBasic2(_ data: Data? = nil) throws -> FireKit.Basic {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "basic-example.json")
        
        XCTAssertEqual(inst.author?.reference, "Practitioner/example")
        XCTAssertEqual(inst.code?.coding[0].code, "referral")
        XCTAssertEqual(inst.code?.coding[0].system, "http://hl7.org/fhir/basic-resource-type")
        XCTAssertEqual(inst.created?.description, "2013-05-14")
        XCTAssertEqual(inst.extension_fhir[0].url, "http://example.org/do-not-use/fhir-extensions/referral#requestingPractitioner")
        XCTAssertEqual(inst.extension_fhir[0].valueReference?.display, "Dokter Bronsig")
        XCTAssertEqual(inst.extension_fhir[0].valueReference?.reference, "Practitioner/f201")
        XCTAssertEqual(inst.extension_fhir[1].url, "http://example.org/do-not-use/fhir-extensions/referral#notes")
        XCTAssertEqual(inst.extension_fhir[1].valueString, "The patient had fever peaks over the last couple of days. He is worried about these peaks.")
        XCTAssertEqual(inst.extension_fhir[2].url, "http://example.org/do-not-use/fhir-extensions/referral#fulfillingEncounter")
        XCTAssertEqual(inst.extension_fhir[2].valueReference?.reference, "Encounter/f201")
        XCTAssertEqual(inst.id, "referral")
        XCTAssertEqual(inst.modifierExtension[0].url, "http://example.org/do-not-use/fhir-extensions/referral#referredForService")
        XCTAssertEqual(inst.modifierExtension[0].valueCodeableConcept?.coding[0].code, "11429006")
        XCTAssertEqual(inst.modifierExtension[0].valueCodeableConcept?.coding[0].display, "Consultation")
        XCTAssertEqual(inst.modifierExtension[0].valueCodeableConcept?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.modifierExtension[1].url, "http://example.org/do-not-use/fhir-extensions/referral#targetDate")
        XCTAssertEqual(inst.modifierExtension[1].valuePeriod?.end?.description, "2013-04-15")
        XCTAssertEqual(inst.modifierExtension[1].valuePeriod?.start?.description, "2013-04-01")
        XCTAssertEqual(inst.modifierExtension[2].url, "http://example.org/do-not-use/fhir-extensions/referral#status")
        XCTAssertEqual(inst.modifierExtension[2].valueCode, "complete")
        XCTAssertEqual(inst.subject?.display, "Roel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f201")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testBasic3() {   
        var instance: FireKit.Basic?
        do {
            instance = try runBasic3()
            try runBasic3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Basic successfully, but threw: \(error)")
        }

        testBasicRealm3(instance!)
    }

    func testBasic3Copying() {
        do {
            let instance = try runBasic3()
            let copy = instance.copy() as? FireKit.Basic
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBasic3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Basic successfully, but threw: \(error)")
        }
    }

    func testBasic3Populatability() {
        do {
            let instance = try runBasic3()
            let copy = FireKit.Basic()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBasic3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Basic successfully, but threw: \(error)")
        }
    }

    func testBasicRealm3(_ instance: FireKit.Basic) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBasic3(JSONEncoder().encode(realm.objects(FireKit.Basic.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Basic.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Basic.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Basic()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Basic.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Basic.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Basic.self).count)
    }
    
    @discardableResult
    func runBasic3(_ data: Data? = nil) throws -> FireKit.Basic {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "basic-example2.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "UMLCLASSMODEL")
        XCTAssertEqual(inst.code?.coding[0].system, "http://example.org/do-not-use/fhir-codes#resourceTypes")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].url, "name")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].valueString, "Class1")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[0].url, "name")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[0].valueString, "attribute1")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[1].url, "minOccurs")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[1].valueInteger.value, 1)
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[2].url, "maxOccurs")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[2].valueCode, "*")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].url, "attribute")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[0].url, "name")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[0].valueString, "attribute2")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[1].url, "minOccurs")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[1].valueInteger.value, 0)
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[2].url, "maxOccurs")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[2].valueInteger.value, 1)
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].url, "attribute")
        XCTAssertEqual(inst.extension_fhir[0].url, "http://example.org/do-not-use/fhir-extensions/UMLclass")
        XCTAssertEqual(inst.id, "classModel")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p><b>Class1</b></p>\n      <ul>\n        <li>Attribute1: 1..*</li>\n        <li>Attribute2: 0..1</li>\n      </ul>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}