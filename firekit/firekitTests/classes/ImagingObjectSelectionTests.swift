//
//  ImagingObjectSelectionTests.swift
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


class ImagingObjectSelectionTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.ImagingObjectSelection {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.ImagingObjectSelection {
        // print("Inflating FireKit.ImagingObjectSelection from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.ImagingObjectSelection.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testImagingObjectSelection1() {   
        var instance: FireKit.ImagingObjectSelection?
        do {
            instance = try runImagingObjectSelection1()
            try runImagingObjectSelection1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ImagingObjectSelection successfully, but threw: \(error)")
        }

        testImagingObjectSelectionRealm1(instance!)
    }

    func testImagingObjectSelection1Copying() {
        do {
            let instance = try runImagingObjectSelection1()
            let copy = instance.copy() as? FireKit.ImagingObjectSelection
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runImagingObjectSelection1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ImagingObjectSelection successfully, but threw: \(error)")
        }
    }

    func testImagingObjectSelection1Populatability() {
        do {
            let instance = try runImagingObjectSelection1()
            let copy = FireKit.ImagingObjectSelection()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runImagingObjectSelection1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ImagingObjectSelection successfully, but threw: \(error)")
        }
    }

    func testImagingObjectSelectionRealm1(_ instance: FireKit.ImagingObjectSelection) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runImagingObjectSelection1(JSONEncoder().encode(realm.objects(FireKit.ImagingObjectSelection.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ImagingObjectSelection.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ImagingObjectSelection.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ImagingObjectSelection()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.ImagingObjectSelection.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ImagingObjectSelection.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ImagingObjectSelection.self).count)
    }
    
    @discardableResult
    func runImagingObjectSelection1(_ data: Data? = nil) throws -> FireKit.ImagingObjectSelection {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "imagingobjectselection-example.json")
        
        XCTAssertEqual(inst.authoringTime?.description, "2014-11-20T11:01:20-08:00")
        XCTAssertEqual(inst.description_fhir, "1 SC image (screen snapshot) and 2 CT images to share a chest CT exam")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.patient?.reference, "Patient/dicom")
        XCTAssertEqual(inst.study[0].series[0].instance[0].sopClass, "urn:oid:1.2.840.10008.5.1.4.1.1.7")
        XCTAssertEqual(inst.study[0].series[0].instance[0].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16748.2599092902")
        XCTAssertEqual(inst.study[0].series[0].instance[0].url, "http://localhost/wado/SCP/2.16.124.113543.6003.189642796.63084.16749.2599092904")
        XCTAssertEqual(inst.study[0].series[0].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16750.2599092901")
        XCTAssertEqual(inst.study[0].series[1].instance[0].sopClass, "urn:oid:1.2.840.10008.5.1.4.1.1.2")
        XCTAssertEqual(inst.study[0].series[1].instance[0].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16748.2599092903")
        XCTAssertEqual(inst.study[0].series[1].instance[0].url, "http://localhost/wado/SCP/2.16.124.113543.6003.189642796.63084.16748.2599092903")
        XCTAssertEqual(inst.study[0].series[1].instance[1].sopClass, "urn:oid:1.2.840.10008.5.1.4.1.1.2")
        XCTAssertEqual(inst.study[0].series[1].instance[1].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16748.2599092904")
        XCTAssertEqual(inst.study[0].series[1].instance[1].url, "http://localhost/wado/SCP/2.16.124.113543.6003.189642796.63084.16750.2599092902")
        XCTAssertEqual(inst.study[0].series[1].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16750.2599092902")
        XCTAssertEqual(inst.study[0].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16749.2599092904")
        XCTAssertEqual(inst.text?.div, "<div>A set of images accompanying to an exam document, including one SC image and two CT images, to publish the exam sharing</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.title?.coding[0].code, "113030")
        XCTAssertEqual(inst.title?.coding[0].display, "Manifest")
        XCTAssertEqual(inst.title?.coding[0].system, "http://nema.org/dicom/dicm")
        XCTAssertEqual(inst.title?.text, "A set of objects that have been exported for sharing")
        XCTAssertEqual(inst.uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16748.2599092901")

        return inst
    }
}