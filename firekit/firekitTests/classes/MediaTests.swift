//
//  MediaTests.swift
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


class MediaTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Media {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Media {
        // print("Inflating FireKit.Media from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Media.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testMedia1() {   
        var instance: FireKit.Media?
        do {
            instance = try runMedia1()
            try runMedia1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Media successfully, but threw: \(error)")
        }

        testMediaRealm1(instance!)
    }

    func testMedia1Copying() {
        do {
            let instance = try runMedia1()
            let copy = instance.copy() as? FireKit.Media
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMedia1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Media successfully, but threw: \(error)")
        }
    }

    func testMedia1Populatability() {
        do {
            let instance = try runMedia1()
            let copy = FireKit.Media()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMedia1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Media successfully, but threw: \(error)")
        }
    }

    func testMediaRealm1(_ instance: FireKit.Media) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMedia1(JSONEncoder().encode(realm.objects(FireKit.Media.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Media.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Media()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Media.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Media.self).count)
    }
    
    @discardableResult
    func runMedia1(_ data: Data? = nil) throws -> FireKit.Media {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "media-example-dicom.json")
        
        XCTAssertEqual(inst.content?.contentType, "application/dicom")
        XCTAssertEqual(inst.deviceName, "G.E. Medical Systems")
        XCTAssertEqual(inst.extension_fhir[0].url, "http://nema.org/fhir/extensions#0002-0010")
        XCTAssertEqual(inst.extension_fhir[0].valueUri, "urn:oid:1.2.840.10008.1.2.1")
        XCTAssertEqual(inst.height.value, 480)
        XCTAssertEqual(inst.id, "1.2.840.11361907579238403408700.3.0.14.19970327150033")
        XCTAssertEqual(inst.identifier[0].system, "urn:ietf:rfc:3986")
        XCTAssertEqual(inst.identifier[0].type?.text, "InstanceUID")
        XCTAssertEqual(inst.identifier[0].use, "official")
        XCTAssertEqual(inst.identifier[0].value, "urn:oid:1.2.840.11361907579238403408700.3.0.14.19970327150033")
        XCTAssertEqual(inst.identifier[1].system, "http://acme-imaging.com/accession/2012")
        XCTAssertEqual(inst.identifier[1].type?.text, "accessionNo")
        XCTAssertEqual(inst.identifier[1].value, "1234567")
        XCTAssertEqual(inst.identifier[2].system, "urn:ietf:rfc:3986")
        XCTAssertEqual(inst.identifier[2].type?.text, "studyId")
        XCTAssertEqual(inst.identifier[2].value, "urn:oid:1.2.840.113619.2.21.848.34082.0.538976288.3")
        XCTAssertEqual(inst.identifier[3].system, "urn:ietf:rfc:3986")
        XCTAssertEqual(inst.identifier[3].type?.text, "seriesId")
        XCTAssertEqual(inst.identifier[3].value, "urn:oid:1.2.840.113619.2.21.3408.700.0.757923840.3.0")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.subtype?.coding[0].code, "US")
        XCTAssertEqual(inst.subtype?.coding[0].system, "http://nema.org/dicom/dicm")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "photo")
        XCTAssertEqual(inst.view?.coding[0].code, "399067008")
        XCTAssertEqual(inst.view?.coding[0].display, "Lateral projection")
        XCTAssertEqual(inst.view?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.width.value, 640)

        return inst
    }
    
    func testMedia2() {   
        var instance: FireKit.Media?
        do {
            instance = try runMedia2()
            try runMedia2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Media successfully, but threw: \(error)")
        }

        testMediaRealm2(instance!)
    }

    func testMedia2Copying() {
        do {
            let instance = try runMedia2()
            let copy = instance.copy() as? FireKit.Media
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMedia2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Media successfully, but threw: \(error)")
        }
    }

    func testMedia2Populatability() {
        do {
            let instance = try runMedia2()
            let copy = FireKit.Media()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMedia2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Media successfully, but threw: \(error)")
        }
    }

    func testMediaRealm2(_ instance: FireKit.Media) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMedia2(JSONEncoder().encode(realm.objects(FireKit.Media.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Media.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Media()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Media.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Media.self).count)
    }
    
    @discardableResult
    func runMedia2(_ data: Data? = nil) throws -> FireKit.Media {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "media-example-sound.json")
        
        XCTAssertEqual(inst.content?.contentType, "audio/mpeg")
        XCTAssertTrue(inst.content?.data! == Base64Binary(val: "dG9vIGJpZyB0b28gaW5jbHVkZSB0aGUgd2hvbGU="))
        XCTAssertEqual(inst.content?.id, "a1")
        XCTAssertEqual(inst.duration.value, 65)
        XCTAssertEqual(inst.id, "sound")
        XCTAssertEqual(inst.operator_fhir?.reference, "Practitioner/xcda-author")
        XCTAssertEqual(inst.subject?.reference, "Patient/xcda")
        XCTAssertEqual(inst.text?.div, "<div>Sound recording of speech example for Patient Henry Levin (MRN 12345):<br/><img alt=\"diagram\" src=\"#11\"/></div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "video")

        return inst
    }
    
    func testMedia3() {   
        var instance: FireKit.Media?
        do {
            instance = try runMedia3()
            try runMedia3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Media successfully, but threw: \(error)")
        }

        testMediaRealm3(instance!)
    }

    func testMedia3Copying() {
        do {
            let instance = try runMedia3()
            let copy = instance.copy() as? FireKit.Media
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMedia3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Media successfully, but threw: \(error)")
        }
    }

    func testMedia3Populatability() {
        do {
            let instance = try runMedia3()
            let copy = FireKit.Media()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMedia3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Media successfully, but threw: \(error)")
        }
    }

    func testMediaRealm3(_ instance: FireKit.Media) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMedia3(JSONEncoder().encode(realm.objects(FireKit.Media.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Media.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Media()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Media.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Media.self).count)
    }
    
    @discardableResult
    func runMedia3(_ data: Data? = nil) throws -> FireKit.Media {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "media-example.json")
        
        XCTAssertEqual(inst.content?.contentType, "image/gif")
        XCTAssertEqual(inst.content?.creation?.description, "2009-09-03")
        XCTAssertEqual(inst.content?.id, "a1")
        XCTAssertEqual(inst.deviceName, "Acme Camera")
        XCTAssertEqual(inst.frames.value, 1)
        XCTAssertEqual(inst.height.value, 145)
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.operator_fhir?.reference, "Practitioner/xcda-author")
        XCTAssertEqual(inst.subject?.reference, "Patient/xcda")
        XCTAssertEqual(inst.subtype?.coding[0].code, "diagram")
        XCTAssertEqual(inst.subtype?.coding[0].system, "http://hl7.org/fhir/media-method")
        XCTAssertEqual(inst.text?.div, "<div>Diagram for Patient Henry Levin (MRN 12345):<br/><img alt=\"diagram\" src=\"#11\"/></div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "photo")
        XCTAssertEqual(inst.width.value, 126)

        return inst
    }
}