//
//  NamingSystemTests.swift
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


class NamingSystemTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.NamingSystem {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.NamingSystem {
        // print("Inflating FireKit.NamingSystem from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.NamingSystem.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testNamingSystem1() {   
        var instance: FireKit.NamingSystem?
        do {
            instance = try runNamingSystem1()
            try runNamingSystem1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test NamingSystem successfully, but threw: \(error)")
        }

        testNamingSystemRealm1(instance!)
    }

    func testNamingSystem1Copying() {
        do {
            let instance = try runNamingSystem1()
            let copy = instance.copy() as? FireKit.NamingSystem
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runNamingSystem1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test NamingSystem successfully, but threw: \(error)")
        }
    }

    func testNamingSystem1Populatability() {
        do {
            let instance = try runNamingSystem1()
            let copy = FireKit.NamingSystem()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runNamingSystem1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test NamingSystem successfully, but threw: \(error)")
        }
    }

    func testNamingSystemRealm1(_ instance: FireKit.NamingSystem) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNamingSystem1(JSONEncoder().encode(realm.objects(FireKit.NamingSystem.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NamingSystem.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NamingSystem()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.NamingSystem.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NamingSystem.self).count)
    }
    
    @discardableResult
    func runNamingSystem1(_ data: Data? = nil) throws -> FireKit.NamingSystem {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "namingsystem-example-id.json")
        
        XCTAssertEqual(inst.contact[0].name, "HL7 Australia FHIR Team")
        XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
        XCTAssertEqual(inst.contact[0].telecom[0].value, "http://hl7-australia.wikispaces.com/FHIR+Australia")
        XCTAssertEqual(inst.date?.description, "2015-08-31")
        XCTAssertEqual(inst.description_fhir, "Australian HI Identifier as established by relevant regulations etc")
        XCTAssertEqual(inst.id, "example-id")
        XCTAssertEqual(inst.kind, "identifier")
        XCTAssertEqual(inst.name, "Austalian Healthcare Identifier - Individual")
        XCTAssertEqual(inst.publisher, "HL7 Australia on behalf of NEHTA")
        XCTAssertEqual(inst.responsible, "HI Service Operator / NEHTA")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>\n        <b>Australian IHI Number</b>\n      </p>\n      \n      <p> oid: 1.2.36.1.2001.1003.0</p>\n      \n      <p> uri: http://ns.electronichealth.net.au/id/hi/ihi/1.0</p>\n    \n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "NI")
        XCTAssertEqual(inst.type?.coding[0].display, "National unique individual identifier")
        XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v2/0203")
        XCTAssertEqual(inst.type?.text, "IHI")
        XCTAssertEqual(inst.uniqueId[0].type, "oid")
        XCTAssertEqual(inst.uniqueId[0].value, "1.2.36.1.2001.1003.0")
        XCTAssertEqual(inst.uniqueId[1].period?.start?.description, "2015-08-21")
        XCTAssertTrue(inst.uniqueId[1].preferred.value ?? false)
        XCTAssertEqual(inst.uniqueId[1].type, "uri")
        XCTAssertEqual(inst.uniqueId[1].value, "http://ns.electronichealth.net.au/id/hi/ihi/1.0")
        XCTAssertEqual(inst.usage, "Used in Australia for identifying patients")
        XCTAssertEqual(inst.useContext[0].coding[0].code, "AU")
        XCTAssertEqual(inst.useContext[0].coding[0].system, "urn:iso:std:iso:3166")

        return inst
    }
    
    func testNamingSystem2() {   
        var instance: FireKit.NamingSystem?
        do {
            instance = try runNamingSystem2()
            try runNamingSystem2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test NamingSystem successfully, but threw: \(error)")
        }

        testNamingSystemRealm2(instance!)
    }

    func testNamingSystem2Copying() {
        do {
            let instance = try runNamingSystem2()
            let copy = instance.copy() as? FireKit.NamingSystem
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runNamingSystem2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test NamingSystem successfully, but threw: \(error)")
        }
    }

    func testNamingSystem2Populatability() {
        do {
            let instance = try runNamingSystem2()
            let copy = FireKit.NamingSystem()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runNamingSystem2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test NamingSystem successfully, but threw: \(error)")
        }
    }

    func testNamingSystemRealm2(_ instance: FireKit.NamingSystem) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNamingSystem2(JSONEncoder().encode(realm.objects(FireKit.NamingSystem.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NamingSystem.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NamingSystem()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.NamingSystem.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NamingSystem.self).count)
    }
    
    @discardableResult
    func runNamingSystem2(_ data: Data? = nil) throws -> FireKit.NamingSystem {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "namingsystem-example-replaced.json")
        
        XCTAssertEqual(inst.date?.description, "2005-01-25")
        XCTAssertEqual(inst.description_fhir, "This was a wrong registration for the spanish editions of SNOMED CT. Do not use")
        XCTAssertEqual(inst.id, "example-replaced")
        XCTAssertEqual(inst.kind, "codesystem")
        XCTAssertEqual(inst.name, "SNOMED CT Spanish")
        XCTAssertEqual(inst.publisher, "Not HL7!")
        XCTAssertEqual(inst.replacedBy?.reference, "NamingSystem/example")
        XCTAssertEqual(inst.status, "retired")
        XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>\n        <b>Deprecated SNOMED CT Spanish Registration</b>\n      </p>\n      \n      <p> oid: 2.16.840.1.113883.6.96.1 - deprecated <b>Do Not Use</b></p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.uniqueId[0].type, "oid")
        XCTAssertEqual(inst.uniqueId[0].value, "2.16.840.1.113883.6.96.1")

        return inst
    }
    
    func testNamingSystem3() {   
        var instance: FireKit.NamingSystem?
        do {
            instance = try runNamingSystem3()
            try runNamingSystem3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test NamingSystem successfully, but threw: \(error)")
        }

        testNamingSystemRealm3(instance!)
    }

    func testNamingSystem3Copying() {
        do {
            let instance = try runNamingSystem3()
            let copy = instance.copy() as? FireKit.NamingSystem
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runNamingSystem3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test NamingSystem successfully, but threw: \(error)")
        }
    }

    func testNamingSystem3Populatability() {
        do {
            let instance = try runNamingSystem3()
            let copy = FireKit.NamingSystem()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runNamingSystem3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test NamingSystem successfully, but threw: \(error)")
        }
    }

    func testNamingSystemRealm3(_ instance: FireKit.NamingSystem) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNamingSystem3(JSONEncoder().encode(realm.objects(FireKit.NamingSystem.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NamingSystem.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NamingSystem()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.NamingSystem.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NamingSystem.self).count)
    }
    
    @discardableResult
    func runNamingSystem3(_ data: Data? = nil) throws -> FireKit.NamingSystem {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "namingsystem-example.json")
        
        XCTAssertEqual(inst.contact[0].name, "FHIR project team")
        XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
        XCTAssertEqual(inst.contact[0].telecom[0].value, "http://hl7.org/fhir")
        XCTAssertEqual(inst.date?.description, "2014-12-13")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.kind, "codesystem")
        XCTAssertEqual(inst.name, "SNOMED CT")
        XCTAssertEqual(inst.publisher, "HL7 International on behalf of IHTSDO")
        XCTAssertEqual(inst.responsible, "IHTSDO & affiliates")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>\n        <b>SNOMED CT</b>\n      </p>\n      \n      <p> oid: 2.16.840.1.113883.6.96</p>\n      \n      <p> uri: http://snomed.info/sct</p>\n    \n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.uniqueId[0].type, "oid")
        XCTAssertEqual(inst.uniqueId[0].value, "2.16.840.1.113883.6.96")
        XCTAssertTrue(inst.uniqueId[1].preferred.value ?? false)
        XCTAssertEqual(inst.uniqueId[1].type, "uri")
        XCTAssertEqual(inst.uniqueId[1].value, "http://snomed.info/sct")

        return inst
    }
}