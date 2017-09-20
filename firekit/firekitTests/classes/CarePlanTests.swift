//
//  CarePlanTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-19.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-09-19
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class CarePlanTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.CarePlan {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.CarePlan {
        // print("Inflating FireKit.CarePlan from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.CarePlan.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testCarePlan1() {   
        var instance: FireKit.CarePlan?
        do {
            instance = try runCarePlan1()
            try runCarePlan1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test CarePlan successfully, but threw: \(error)")
        }

        testCarePlanRealm1(instance!)
    }

    func testCarePlan1Copying() {
        do {
            let instance = try runCarePlan1()
            let copy = instance.copy() as? FireKit.CarePlan
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCarePlan1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlan1Populatability() {
        do {
            let instance = try runCarePlan1()
            let copy = FireKit.CarePlan()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCarePlan1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlanRealm1(_ instance: FireKit.CarePlan) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCarePlan1(JSONEncoder().encode(realm.objects(FireKit.CarePlan.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CarePlan.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CarePlan()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.CarePlan.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CarePlan.self).count)
    }
    
    @discardableResult
    func runCarePlan1(_ data: Data? = nil) throws -> FireKit.CarePlan {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "careplan-example-f001-heart.json")
        
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].code, "procedure")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].code, "64915003")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].display, "Operation on heart")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].display, "P. Voigt")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].reference, "Practitioner/f002")
        XCTAssertTrue(inst.activity[0].detail?.prohibited.value ?? false)
        XCTAssertEqual(inst.activity[0].detail?.scheduledString, "2011-06-27T09:30:10+01:00")
        XCTAssertEqual(inst.activity[0].detail?.status, "completed")
        XCTAssertEqual(inst.addresses[0].display, "?????")
        XCTAssertEqual(inst.addresses[0].reference, "Condition/f201")
        XCTAssertEqual(inst.contained[0].id, "goal")
        XCTAssertEqual(inst.goal[0].reference, "#goal")
        XCTAssertEqual(inst.id, "f001")
        XCTAssertEqual(inst.identifier[0].system, "http://www.bmc.nl/zorgportal/identifiers/careplans")
        XCTAssertEqual(inst.identifier[0].use, "official")
        XCTAssertEqual(inst.identifier[0].value, "CP2903")
        XCTAssertEqual(inst.modified?.description, "2011-06-27T09:30:10+01:00")
        XCTAssertEqual(inst.participant[0].member?.display, "P. Voigt")
        XCTAssertEqual(inst.participant[0].member?.reference, "Practitioner/f002")
        XCTAssertEqual(inst.period?.end?.description, "2011-06-27")
        XCTAssertEqual(inst.period?.start?.description, "2011-06-26")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.display, "P. van de Heuvel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f001")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testCarePlan2() {   
        var instance: FireKit.CarePlan?
        do {
            instance = try runCarePlan2()
            try runCarePlan2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test CarePlan successfully, but threw: \(error)")
        }

        testCarePlanRealm2(instance!)
    }

    func testCarePlan2Copying() {
        do {
            let instance = try runCarePlan2()
            let copy = instance.copy() as? FireKit.CarePlan
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCarePlan2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlan2Populatability() {
        do {
            let instance = try runCarePlan2()
            let copy = FireKit.CarePlan()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCarePlan2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlanRealm2(_ instance: FireKit.CarePlan) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCarePlan2(JSONEncoder().encode(realm.objects(FireKit.CarePlan.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CarePlan.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CarePlan()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.CarePlan.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CarePlan.self).count)
    }
    
    @discardableResult
    func runCarePlan2(_ data: Data? = nil) throws -> FireKit.CarePlan {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "careplan-example-f002-lung.json")
        
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].code, "procedure")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].code, "359615001")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].display, "Partial lobectomy of lung")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].display, "M.I.M. Versteegh")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].reference, "Practitioner/f003")
        XCTAssertTrue(inst.activity[0].detail?.prohibited.value ?? false)
        XCTAssertEqual(inst.activity[0].detail?.scheduledString, "2011-07-07T09:30:10+01:00")
        XCTAssertEqual(inst.activity[0].detail?.status, "completed")
        XCTAssertEqual(inst.addresses[0].display, "?????")
        XCTAssertEqual(inst.addresses[0].reference, "Condition/f201")
        XCTAssertEqual(inst.contained[0].id, "goal")
        XCTAssertEqual(inst.goal[0].reference, "#goal")
        XCTAssertEqual(inst.id, "f002")
        XCTAssertEqual(inst.identifier[0].system, "http://www.bmc.nl/zorgportal/identifiers/careplans")
        XCTAssertEqual(inst.identifier[0].use, "official")
        XCTAssertEqual(inst.identifier[0].value, "CP2934")
        XCTAssertEqual(inst.modified?.description, "2011-07-07T09:30:10+01:00")
        XCTAssertEqual(inst.participant[0].member?.display, "M.I.M. Versteegh")
        XCTAssertEqual(inst.participant[0].member?.reference, "Practitioner/f003")
        XCTAssertEqual(inst.period?.end?.description, "2013-07-07")
        XCTAssertEqual(inst.period?.start?.description, "2011-07-06")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.display, "P. van de Heuvel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f001")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testCarePlan3() {   
        var instance: FireKit.CarePlan?
        do {
            instance = try runCarePlan3()
            try runCarePlan3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test CarePlan successfully, but threw: \(error)")
        }

        testCarePlanRealm3(instance!)
    }

    func testCarePlan3Copying() {
        do {
            let instance = try runCarePlan3()
            let copy = instance.copy() as? FireKit.CarePlan
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCarePlan3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlan3Populatability() {
        do {
            let instance = try runCarePlan3()
            let copy = FireKit.CarePlan()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCarePlan3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlanRealm3(_ instance: FireKit.CarePlan) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCarePlan3(JSONEncoder().encode(realm.objects(FireKit.CarePlan.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CarePlan.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CarePlan()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.CarePlan.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CarePlan.self).count)
    }
    
    @discardableResult
    func runCarePlan3(_ data: Data? = nil) throws -> FireKit.CarePlan {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "careplan-example-f003-pharynx.json")
        
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].code, "procedure")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].code, "172960003")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].display, "Incision of retropharyngeal abscess")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].display, "E.M. van den broek")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].reference, "Practitioner/f001")
        XCTAssertTrue(inst.activity[0].detail?.prohibited.value ?? false)
        XCTAssertEqual(inst.activity[0].detail?.scheduledString, "2011-06-27T09:30:10+01:00")
        XCTAssertEqual(inst.activity[0].detail?.status, "completed")
        XCTAssertEqual(inst.addresses[0].display, "?????")
        XCTAssertEqual(inst.addresses[0].reference, "Condition/f201")
        XCTAssertEqual(inst.contained[0].id, "goal")
        XCTAssertEqual(inst.goal[0].reference, "#goal")
        XCTAssertEqual(inst.id, "f003")
        XCTAssertEqual(inst.identifier[0].system, "http://www.bmc.nl/zorgportal/identifiers/careplans")
        XCTAssertEqual(inst.identifier[0].use, "official")
        XCTAssertEqual(inst.identifier[0].value, "CP3953")
        XCTAssertEqual(inst.modified?.description, "2013-06-27T09:30:10+01:00")
        XCTAssertEqual(inst.participant[0].member?.display, "E.M. van den broek")
        XCTAssertEqual(inst.participant[0].member?.reference, "Practitioner/f001")
        XCTAssertEqual(inst.period?.end?.description, "2013-03-08T09:30:10+01:00")
        XCTAssertEqual(inst.period?.start?.description, "2013-03-08T09:00:10+01:00")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.display, "P. van de Heuvel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f001")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testCarePlan4() {   
        var instance: FireKit.CarePlan?
        do {
            instance = try runCarePlan4()
            try runCarePlan4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test CarePlan successfully, but threw: \(error)")
        }

        testCarePlanRealm4(instance!)
    }

    func testCarePlan4Copying() {
        do {
            let instance = try runCarePlan4()
            let copy = instance.copy() as? FireKit.CarePlan
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCarePlan4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlan4Populatability() {
        do {
            let instance = try runCarePlan4()
            let copy = FireKit.CarePlan()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCarePlan4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlanRealm4(_ instance: FireKit.CarePlan) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCarePlan4(JSONEncoder().encode(realm.objects(FireKit.CarePlan.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CarePlan.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CarePlan()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.CarePlan.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CarePlan.self).count)
    }
    
    @discardableResult
    func runCarePlan4(_ data: Data? = nil) throws -> FireKit.CarePlan {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "careplan-example-f201-renal.json")
        
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].code, "diet")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].code, "284093001")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].display, "Potassium supplementation")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.activity[0].detail?.dailyAmount?.code, "258718000")
        XCTAssertEqual(inst.activity[0].detail?.dailyAmount?.system, "http://snomed.info/sct")
        XCTAssertEqual(inst.activity[0].detail?.dailyAmount?.unit, "mmol")
        XCTAssertTrue(inst.activity[0].detail?.dailyAmount?.value! == RealmDecimal(string: "80"))
        XCTAssertEqual(inst.activity[0].detail?.productReference?.display, "Potassium")
        XCTAssertEqual(inst.activity[0].detail?.productReference?.reference, "Substance/f203")
        XCTAssertFalse(inst.activity[0].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[0].detail?.scheduledString, "daily")
        XCTAssertEqual(inst.activity[0].detail?.status, "completed")
        XCTAssertEqual(inst.activity[1].detail?.category?.coding[0].code, "observation")
        XCTAssertEqual(inst.activity[1].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[1].detail?.code?.coding[0].code, "306005")
        XCTAssertEqual(inst.activity[1].detail?.code?.coding[0].display, "Echography of kidney")
        XCTAssertEqual(inst.activity[1].detail?.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertFalse(inst.activity[1].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[1].detail?.status, "completed")
        XCTAssertEqual(inst.addresses[0].display, "Roel's renal insufficiency")
        XCTAssertEqual(inst.addresses[0].reference, "Condition/f204")
        XCTAssertEqual(inst.contained[0].id, "goal")
        XCTAssertEqual(inst.goal[0].reference, "#goal")
        XCTAssertEqual(inst.id, "f201")
        XCTAssertEqual(inst.modified?.description, "2013-03-11")
        XCTAssertEqual(inst.participant[0].member?.display, "Dokter Bronsig")
        XCTAssertEqual(inst.participant[0].member?.reference, "Practitioner/f201")
        XCTAssertEqual(inst.participant[0].role?.coding[0].code, "425268008")
        XCTAssertEqual(inst.participant[0].role?.coding[0].display, "Review of care plan")
        XCTAssertEqual(inst.participant[0].role?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.participant[1].member?.display, "Nurse Carla Espinosa")
        XCTAssertEqual(inst.participant[1].member?.reference, "Practitioner/f204")
        XCTAssertEqual(inst.participant[1].role?.coding[0].code, "229774002")
        XCTAssertEqual(inst.participant[1].role?.coding[0].display, "Carer")
        XCTAssertEqual(inst.participant[1].role?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.period?.end?.description, "2013-03-13")
        XCTAssertEqual(inst.period?.start?.description, "2013-03-11")
        XCTAssertEqual(inst.status, "draft")
        XCTAssertEqual(inst.subject?.display, "Roel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f201")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testCarePlan5() {   
        var instance: FireKit.CarePlan?
        do {
            instance = try runCarePlan5()
            try runCarePlan5(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test CarePlan successfully, but threw: \(error)")
        }

        testCarePlanRealm5(instance!)
    }

    func testCarePlan5Copying() {
        do {
            let instance = try runCarePlan5()
            let copy = instance.copy() as? FireKit.CarePlan
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCarePlan5(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlan5Populatability() {
        do {
            let instance = try runCarePlan5()
            let copy = FireKit.CarePlan()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCarePlan5(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlanRealm5(_ instance: FireKit.CarePlan) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCarePlan5(JSONEncoder().encode(realm.objects(FireKit.CarePlan.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CarePlan.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CarePlan()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.CarePlan.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CarePlan.self).count)
    }
    
    @discardableResult
    func runCarePlan5(_ data: Data? = nil) throws -> FireKit.CarePlan {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "careplan-example-f202-malignancy.json")
        
        XCTAssertEqual(inst.activity[0].actionResulting[0].display, "Roel's Chemotherapy")
        XCTAssertEqual(inst.activity[0].actionResulting[0].reference, "Procedure/f201")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].code, "procedure")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].code, "367336001")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].display, "Chemotherapy")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.activity[0].detail?.productReference?.reference, "#tpf")
        XCTAssertFalse(inst.activity[0].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[0].detail?.status, "in-progress")
        XCTAssertEqual(inst.addresses[0].display, "Roel's head-neck tumor")
        XCTAssertEqual(inst.addresses[0].reference, "Condition/f202")
        XCTAssertEqual(inst.contained[0].id, "doce")
        XCTAssertEqual(inst.contained[1].id, "cisp")
        XCTAssertEqual(inst.contained[2].id, "fluo")
        XCTAssertEqual(inst.contained[3].id, "tpf")
        XCTAssertEqual(inst.contained[4].id, "goal")
        XCTAssertEqual(inst.goal[0].reference, "#goal")
        XCTAssertEqual(inst.id, "f202")
        XCTAssertEqual(inst.participant[0].member?.display, "Dokter Bronsig")
        XCTAssertEqual(inst.participant[0].member?.reference, "Practitioner/f201")
        XCTAssertEqual(inst.participant[0].role?.coding[0].code, "28995006")
        XCTAssertEqual(inst.participant[0].role?.coding[0].display, "Treated with")
        XCTAssertEqual(inst.participant[0].role?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.subject?.display, "Roel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f201")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testCarePlan6() {   
        var instance: FireKit.CarePlan?
        do {
            instance = try runCarePlan6()
            try runCarePlan6(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test CarePlan successfully, but threw: \(error)")
        }

        testCarePlanRealm6(instance!)
    }

    func testCarePlan6Copying() {
        do {
            let instance = try runCarePlan6()
            let copy = instance.copy() as? FireKit.CarePlan
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCarePlan6(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlan6Populatability() {
        do {
            let instance = try runCarePlan6()
            let copy = FireKit.CarePlan()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCarePlan6(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlanRealm6(_ instance: FireKit.CarePlan) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCarePlan6(JSONEncoder().encode(realm.objects(FireKit.CarePlan.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CarePlan.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CarePlan()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.CarePlan.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CarePlan.self).count)
    }
    
    @discardableResult
    func runCarePlan6(_ data: Data? = nil) throws -> FireKit.CarePlan {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "careplan-example-f203-sepsis.json")
        
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].code, "observation")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].code, "241541005")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].display, "High resolution computed tomography of lungs")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertFalse(inst.activity[0].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[0].detail?.status, "not-started")
        XCTAssertEqual(inst.addresses[0].display, "Roel's sepsis")
        XCTAssertEqual(inst.addresses[0].reference, "Condition/f203")
        XCTAssertEqual(inst.contained[0].id, "goal")
        XCTAssertEqual(inst.goal[0].reference, "#goal")
        XCTAssertEqual(inst.id, "f203")
        XCTAssertEqual(inst.modified?.description, "2013-03-11")
        XCTAssertEqual(inst.participant[0].member?.display, "Dokter Bronsig")
        XCTAssertEqual(inst.participant[0].member?.reference, "Practitioner/f201")
        XCTAssertEqual(inst.participant[0].role?.coding[0].code, "425268008")
        XCTAssertEqual(inst.participant[0].role?.coding[0].display, "Review of care plan")
        XCTAssertEqual(inst.participant[0].role?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.participant[1].member?.display, "Luigi Maas")
        XCTAssertEqual(inst.participant[1].member?.reference, "Practitioner/f202")
        XCTAssertEqual(inst.participant[1].role?.coding[0].code, "278110001")
        XCTAssertEqual(inst.participant[1].role?.coding[0].display, "Radiographic imaging")
        XCTAssertEqual(inst.participant[1].role?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.period?.end?.description, "2013-04-21")
        XCTAssertEqual(inst.period?.start?.description, "2013-04-14")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.display, "Roel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f201")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testCarePlan7() {   
        var instance: FireKit.CarePlan?
        do {
            instance = try runCarePlan7()
            try runCarePlan7(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test CarePlan successfully, but threw: \(error)")
        }

        testCarePlanRealm7(instance!)
    }

    func testCarePlan7Copying() {
        do {
            let instance = try runCarePlan7()
            let copy = instance.copy() as? FireKit.CarePlan
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCarePlan7(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlan7Populatability() {
        do {
            let instance = try runCarePlan7()
            let copy = FireKit.CarePlan()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCarePlan7(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlanRealm7(_ instance: FireKit.CarePlan) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCarePlan7(JSONEncoder().encode(realm.objects(FireKit.CarePlan.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CarePlan.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CarePlan()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.CarePlan.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CarePlan.self).count)
    }
    
    @discardableResult
    func runCarePlan7(_ data: Data? = nil) throws -> FireKit.CarePlan {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "careplan-example-GPVisit.json")
        
        XCTAssertEqual(inst.activity[0].actionResulting[0].reference, "Encounter/example")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].code, "encounter")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].code, "nursecon")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].system, "http://example.org/local")
        XCTAssertEqual(inst.activity[0].detail?.code?.text, "Nurse Consultation")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].display, "Nurse Nancy")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].reference, "Practitioner/13")
        XCTAssertFalse(inst.activity[0].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[0].detail?.scheduledPeriod?.end?.description, "2013-01-01T10:50:00+00:00")
        XCTAssertEqual(inst.activity[0].detail?.scheduledPeriod?.start?.description, "2013-01-01T10:38:00+00:00")
        XCTAssertEqual(inst.activity[0].detail?.status, "completed")
        XCTAssertEqual(inst.activity[1].detail?.category?.coding[0].code, "encounter")
        XCTAssertEqual(inst.activity[1].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[1].detail?.code?.coding[0].code, "doccon")
        XCTAssertEqual(inst.activity[1].detail?.code?.coding[0].system, "http://example.org/local")
        XCTAssertEqual(inst.activity[1].detail?.code?.text, "Doctor Consultation")
        XCTAssertEqual(inst.activity[1].detail?.performer[0].display, "Doctor Dave")
        XCTAssertEqual(inst.activity[1].detail?.performer[0].reference, "Practitioner/14")
        XCTAssertFalse(inst.activity[1].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[1].detail?.status, "scheduled")
        XCTAssertEqual(inst.addresses[0].display, "obesity")
        XCTAssertEqual(inst.addresses[0].reference, "#p1")
        XCTAssertEqual(inst.contained[0].id, "p1")
        XCTAssertEqual(inst.contained[1].id, "goal")
        XCTAssertEqual(inst.goal[0].reference, "#goal")
        XCTAssertEqual(inst.id, "gpvisit")
        XCTAssertEqual(inst.participant[0].id, "part1")
        XCTAssertEqual(inst.participant[0].member?.display, "Nurse Nancy")
        XCTAssertEqual(inst.participant[0].member?.reference, "Practitioner/13")
        XCTAssertEqual(inst.participant[0].role?.coding[0].code, "nur")
        XCTAssertEqual(inst.participant[0].role?.coding[0].system, "http://example.org/local")
        XCTAssertEqual(inst.participant[0].role?.text, "nurse")
        XCTAssertEqual(inst.participant[1].id, "part2")
        XCTAssertEqual(inst.participant[1].member?.display, "Doctor Dave")
        XCTAssertEqual(inst.participant[1].member?.reference, "Practitioner/14")
        XCTAssertEqual(inst.participant[1].role?.coding[0].code, "doc")
        XCTAssertEqual(inst.participant[1].role?.coding[0].system, "http://example.org/local")
        XCTAssertEqual(inst.participant[1].role?.text, "doctor")
        XCTAssertEqual(inst.period?.start?.description, "2013-01-01T10:30:00+00:00")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.subject?.display, "Peter James Chalmers")
        XCTAssertEqual(inst.subject?.reference, "Patient/100")
        XCTAssertEqual(inst.text?.status, "additional")

        return inst
    }
    
    func testCarePlan8() {   
        var instance: FireKit.CarePlan?
        do {
            instance = try runCarePlan8()
            try runCarePlan8(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test CarePlan successfully, but threw: \(error)")
        }

        testCarePlanRealm8(instance!)
    }

    func testCarePlan8Copying() {
        do {
            let instance = try runCarePlan8()
            let copy = instance.copy() as? FireKit.CarePlan
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCarePlan8(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlan8Populatability() {
        do {
            let instance = try runCarePlan8()
            let copy = FireKit.CarePlan()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCarePlan8(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlanRealm8(_ instance: FireKit.CarePlan) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCarePlan8(JSONEncoder().encode(realm.objects(FireKit.CarePlan.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CarePlan.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CarePlan()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.CarePlan.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CarePlan.self).count)
    }
    
    @discardableResult
    func runCarePlan8(_ data: Data? = nil) throws -> FireKit.CarePlan {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "careplan-example-integrated.json")
        
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].code, "other")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[0].detail?.description_fhir, "Eve will review photos of high and low density foods and share with her parents")
        XCTAssertEqual(inst.activity[0].detail?.extension_fhir[0].url, "http://example.org/DoNotUse/StructureDefinition/RevisionDate")
        XCTAssertEqual(inst.activity[0].detail?.extension_fhir[0].valueDate?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[0].detail?.goal[0].reference, "#g1")
        XCTAssertFalse(inst.activity[0].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[0].detail?.scheduledPeriod?.start?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[0].detail?.status, "not-started")
        XCTAssertEqual(inst.activity[0].progress[0].text, "Eve eats one meal a day with her parents")
        XCTAssertEqual(inst.activity[0].progress[0].time?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[1].detail?.category?.coding[0].code, "other")
        XCTAssertEqual(inst.activity[1].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[1].detail?.description_fhir, "Eve will ask her dad to asist her to put the head of her bed on blocks")
        XCTAssertEqual(inst.activity[1].detail?.extension_fhir[0].url, "http://example.org/DoNotUse/General/RevisionDate")
        XCTAssertEqual(inst.activity[1].detail?.extension_fhir[0].valueDate?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[1].detail?.goal[0].reference, "#g1")
        XCTAssertFalse(inst.activity[1].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[1].detail?.scheduledPeriod?.start?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[1].detail?.status, "not-started")
        XCTAssertEqual(inst.activity[1].progress[0].text, "Eve will sleep in her bed more often than the couch")
        XCTAssertEqual(inst.activity[1].progress[0].time?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[2].detail?.category?.coding[0].code, "other")
        XCTAssertEqual(inst.activity[2].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[2].detail?.description_fhir, "Eve will reduce her intake of coffee and chocolate")
        XCTAssertEqual(inst.activity[2].detail?.extension_fhir[0].url, "http://example.org/DoNotUse/General/RevisionDate")
        XCTAssertEqual(inst.activity[2].detail?.extension_fhir[0].valueDate?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[2].detail?.goal[0].reference, "#g2")
        XCTAssertFalse(inst.activity[2].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[2].detail?.scheduledPeriod?.start?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[2].detail?.status, "in-progress")
        XCTAssertEqual(inst.activity[3].detail?.category?.coding[0].code, "other")
        XCTAssertEqual(inst.activity[3].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[3].detail?.description_fhir, "Eve will walk her friend's dog up and down a big hill 15-30 minutes 3 days a week")
        XCTAssertEqual(inst.activity[3].detail?.extension_fhir[0].url, "http://example.org/DoNotUse/General/RevisionDate")
        XCTAssertEqual(inst.activity[3].detail?.extension_fhir[0].valueDate?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[3].detail?.goal[0].reference, "#g3")
        XCTAssertFalse(inst.activity[3].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[3].detail?.scheduledPeriod?.start?.description, "2012-08-27")
        XCTAssertEqual(inst.activity[3].detail?.status, "in-progress")
        XCTAssertEqual(inst.activity[3].progress[0].text, "Eve would like to try for 5 days a week.")
        XCTAssertEqual(inst.activity[3].progress[0].time?.description, "2012-08-27")
        XCTAssertEqual(inst.activity[3].progress[1].text, "Eve is still walking the dogs.")
        XCTAssertEqual(inst.activity[3].progress[1].time?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[4].detail?.category?.coding[0].code, "other")
        XCTAssertEqual(inst.activity[4].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[4].detail?.description_fhir, "Eve will walk 3 blocks to her parents house twice a week")
        XCTAssertEqual(inst.activity[4].detail?.extension_fhir[0].url, "http://example.org/DoNotUse/General/RevisionDate")
        XCTAssertEqual(inst.activity[4].detail?.extension_fhir[0].valueDate?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[4].detail?.goal[0].reference, "#g3")
        XCTAssertFalse(inst.activity[4].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[4].detail?.scheduledPeriod?.start?.description, "2012-07-23")
        XCTAssertEqual(inst.activity[4].detail?.status, "in-progress")
        XCTAssertEqual(inst.activity[4].progress[0].text, "Eve walked 4 times the last week.")
        XCTAssertEqual(inst.activity[4].progress[0].time?.description, "2012-08-13")
        XCTAssertEqual(inst.activity[4].progress[1].text, "Eve did not walk to her parents the last week, but has plans to start again")
        XCTAssertEqual(inst.activity[4].progress[1].time?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[5].detail?.category?.coding[0].code, "other")
        XCTAssertEqual(inst.activity[5].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[5].detail?.description_fhir, "Eve will us a calendar to check off after medications are taken")
        XCTAssertEqual(inst.activity[5].detail?.extension_fhir[0].url, "http://example.org/DoNotUse/General/RevisionDate")
        XCTAssertEqual(inst.activity[5].detail?.extension_fhir[0].valueDate?.description, "2012-08-13")
        XCTAssertEqual(inst.activity[5].detail?.goal[0].reference, "#g4")
        XCTAssertFalse(inst.activity[5].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[5].detail?.scheduledPeriod?.start?.description, "2012-07-23")
        XCTAssertEqual(inst.activity[5].detail?.status, "in-progress")
        XCTAssertEqual(inst.activity[6].detail?.category?.coding[0].code, "other")
        XCTAssertEqual(inst.activity[6].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[6].detail?.description_fhir, "Eve will use her lights MWF after her shower for 3 minutes")
        XCTAssertEqual(inst.activity[6].detail?.extension_fhir[0].url, "http://example.org/DoNotUse/General/RevisionDate")
        XCTAssertEqual(inst.activity[6].detail?.extension_fhir[0].valueDate?.description, "2012-08-27")
        XCTAssertEqual(inst.activity[6].detail?.goal[0].reference, "#g5")
        XCTAssertFalse(inst.activity[6].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[6].detail?.scheduledPeriod?.start?.description, "2012-07-23")
        XCTAssertEqual(inst.activity[6].detail?.status, "in-progress")
        XCTAssertEqual(inst.activity[6].progress[0].text, "After restarting the vinegar soaks the psoriasis is improved and Eve plans to treat the remainder with light treatments.  She plans to start this week.")
        XCTAssertEqual(inst.activity[6].progress[0].time?.description, "2012-08-13")
        XCTAssertEqual(inst.activity[6].progress[1].text, "Since her skin is improved Eve has not been using the light treatment as often, maybe once a week.  She would like to increase to 3 times a week again")
        XCTAssertEqual(inst.activity[6].progress[1].time?.description, "2012-08-27")
        XCTAssertEqual(inst.activity[7].detail?.category?.coding[0].code, "other")
        XCTAssertEqual(inst.activity[7].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[7].detail?.description_fhir, "Eve will use a calendar of a chart to help her remember when to take her medications")
        XCTAssertEqual(inst.activity[7].detail?.extension_fhir[0].url, "http://example.org/DoNotUse/General/RevisionDate")
        XCTAssertEqual(inst.activity[7].detail?.extension_fhir[0].valueDate?.description, "2012-09-10")
        XCTAssertEqual(inst.activity[7].detail?.goal[0].reference, "#g4")
        XCTAssertFalse(inst.activity[7].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[7].detail?.scheduledPeriod?.start?.description, "2012-07-10")
        XCTAssertEqual(inst.activity[7].detail?.status, "in-progress")
        XCTAssertEqual(inst.activity[7].progress[0].text, "Eve created a chart as a reminer to take the medications that do not fit in her pill box")
        XCTAssertEqual(inst.activity[7].progress[0].time?.description, "2012-07-23")
        XCTAssertEqual(inst.activity[8].detail?.category?.coding[0].code, "other")
        XCTAssertEqual(inst.activity[8].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[8].detail?.description_fhir, "Eve will start using stretch bands and one step 2 days a week Mon/Wed 6-7am and maybe Friday afternoon")
        XCTAssertEqual(inst.activity[8].detail?.extension_fhir[0].url, "http://example.org/DoNotUse/General/RevisionDate")
        XCTAssertEqual(inst.activity[8].detail?.extension_fhir[0].valueDate?.description, "2012-08-23")
        XCTAssertEqual(inst.activity[8].detail?.goal[0].reference, "#g3")
        XCTAssertFalse(inst.activity[8].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[8].detail?.scheduledPeriod?.start?.description, "2012-07-23")
        XCTAssertEqual(inst.activity[8].detail?.status, "on-hold")
        XCTAssertEqual(inst.activity[8].progress[0].text, "Will be able to esume exercise.")
        XCTAssertEqual(inst.activity[8].progress[0].time?.description, "2012-07-30")
        XCTAssertEqual(inst.activity[8].progress[1].text, "Eve prefers to focus on walking at this time")
        XCTAssertEqual(inst.activity[8].progress[1].time?.description, "2012-08-13")
        XCTAssertEqual(inst.activity[9].detail?.category?.coding[0].code, "other")
        XCTAssertEqual(inst.activity[9].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[9].detail?.description_fhir, "Eve will match a printed medication worksheet with the medication bottles at home")
        XCTAssertEqual(inst.activity[9].detail?.extension_fhir[0].url, "http://example.org/DoNotUse/General/RevisionDate")
        XCTAssertEqual(inst.activity[9].detail?.extension_fhir[0].valueDate?.description, "2012-07-23")
        XCTAssertEqual(inst.activity[9].detail?.goal[0].reference, "#g4")
        XCTAssertFalse(inst.activity[9].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[9].detail?.scheduledPeriod?.start?.description, "2012-07-10")
        XCTAssertEqual(inst.activity[9].detail?.status, "completed")
        XCTAssertEqual(inst.addresses[0].display, "GERDS")
        XCTAssertEqual(inst.addresses[0].reference, "#p1")
        XCTAssertEqual(inst.addresses[1].display, "Obesity")
        XCTAssertEqual(inst.addresses[1].reference, "#p2")
        XCTAssertEqual(inst.addresses[2].display, "Psoriasis")
        XCTAssertEqual(inst.addresses[2].reference, "#p3")
        XCTAssertEqual(inst.contained[0].id, "p1")
        XCTAssertEqual(inst.contained[1].id, "p2")
        XCTAssertEqual(inst.contained[2].id, "p3")
        XCTAssertEqual(inst.contained[3].id, "g1")
        XCTAssertEqual(inst.contained[4].id, "g2")
        XCTAssertEqual(inst.contained[5].id, "g3")
        XCTAssertEqual(inst.contained[6].id, "g4")
        XCTAssertEqual(inst.contained[7].id, "g5")
        XCTAssertEqual(inst.goal[0].reference, "#g1")
        XCTAssertEqual(inst.goal[1].reference, "#g2")
        XCTAssertEqual(inst.goal[2].reference, "#g3")
        XCTAssertEqual(inst.goal[3].reference, "#g4")
        XCTAssertEqual(inst.goal[4].reference, "#g5")
        XCTAssertEqual(inst.id, "integrate")
        XCTAssertEqual(inst.modified?.description, "2012-09-10")
        XCTAssertEqual(inst.note?.text, "Patient family is not ready to commit to goal setting at this time.  Goal setting will be addressed in the future")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.subject?.display, "Eve Everywoman")
        XCTAssertEqual(inst.subject?.reference, "Patient/1")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testCarePlan9() {   
        var instance: FireKit.CarePlan?
        do {
            instance = try runCarePlan9()
            try runCarePlan9(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test CarePlan successfully, but threw: \(error)")
        }

        testCarePlanRealm9(instance!)
    }

    func testCarePlan9Copying() {
        do {
            let instance = try runCarePlan9()
            let copy = instance.copy() as? FireKit.CarePlan
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCarePlan9(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlan9Populatability() {
        do {
            let instance = try runCarePlan9()
            let copy = FireKit.CarePlan()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCarePlan9(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlanRealm9(_ instance: FireKit.CarePlan) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCarePlan9(JSONEncoder().encode(realm.objects(FireKit.CarePlan.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CarePlan.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CarePlan()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.CarePlan.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CarePlan.self).count)
    }
    
    @discardableResult
    func runCarePlan9(_ data: Data? = nil) throws -> FireKit.CarePlan {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "careplan-example-pregnancy.json")
        
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].code, "encounter")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].code, "1an")
        XCTAssertEqual(inst.activity[0].detail?.code?.coding[0].system, "http://example.org/mySystem")
        XCTAssertEqual(inst.activity[0].detail?.code?.text, "First Antenatal encounter")
        XCTAssertEqual(inst.activity[0].detail?.description_fhir, "The first antenatal encounter. This is where a detailed physical examination is performed.             and the pregnanacy discussed with the mother-to-be.")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].display, "Mavis Midwife")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].reference, "#pr1")
        XCTAssertFalse(inst.activity[0].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[0].detail?.scheduledTiming?.repeat_fhir?.boundsPeriod?.end?.description, "2013-02-28")
        XCTAssertEqual(inst.activity[0].detail?.scheduledTiming?.repeat_fhir?.boundsPeriod?.start?.description, "2013-02-14")
        XCTAssertEqual(inst.activity[0].detail?.status, "scheduled")
        XCTAssertEqual(inst.activity[0].extension_fhir[0].url, "http://example.org/DoNotUse/careplan#andetails")
        XCTAssertEqual(inst.activity[0].extension_fhir[0].valueUri, "http://orionhealth.com/fhir/careplan/1andetails")
        XCTAssertEqual(inst.activity[1].detail?.category?.coding[0].code, "encounter")
        XCTAssertEqual(inst.activity[1].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[1].detail?.code?.coding[0].code, "an")
        XCTAssertEqual(inst.activity[1].detail?.code?.coding[0].system, "http://example.org/mySystem")
        XCTAssertEqual(inst.activity[1].detail?.code?.text, "Follow-up Antenatal encounter")
        XCTAssertEqual(inst.activity[1].detail?.description_fhir, "The second antenatal encounter. Discuss any issues that arose from the first antenatal encounter")
        XCTAssertEqual(inst.activity[1].detail?.performer[0].display, "Mavis Midwife")
        XCTAssertEqual(inst.activity[1].detail?.performer[0].reference, "#pr1")
        XCTAssertFalse(inst.activity[1].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[1].detail?.scheduledTiming?.repeat_fhir?.boundsPeriod?.end?.description, "2013-03-14")
        XCTAssertEqual(inst.activity[1].detail?.scheduledTiming?.repeat_fhir?.boundsPeriod?.start?.description, "2013-03-01")
        XCTAssertEqual(inst.activity[1].detail?.status, "not-started")
        XCTAssertEqual(inst.activity[2].detail?.category?.coding[0].code, "encounter")
        XCTAssertEqual(inst.activity[2].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[2].detail?.code?.coding[0].code, "del")
        XCTAssertEqual(inst.activity[2].detail?.code?.coding[0].system, "http://example.org/mySystem")
        XCTAssertEqual(inst.activity[2].detail?.code?.text, "Delivery")
        XCTAssertEqual(inst.activity[2].detail?.description_fhir, "The delivery.")
        XCTAssertEqual(inst.activity[2].detail?.performer[0].display, "Mavis Midwife")
        XCTAssertEqual(inst.activity[2].detail?.performer[0].reference, "#pr1")
        XCTAssertFalse(inst.activity[2].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[2].detail?.scheduledTiming?.repeat_fhir?.boundsPeriod?.end?.description, "2013-09-14")
        XCTAssertEqual(inst.activity[2].detail?.scheduledTiming?.repeat_fhir?.boundsPeriod?.start?.description, "2013-09-01")
        XCTAssertEqual(inst.activity[2].detail?.status, "not-started")
        XCTAssertEqual(inst.addresses[0].display, "pregnancy")
        XCTAssertEqual(inst.addresses[0].reference, "#p1")
        XCTAssertEqual(inst.contained[0].id, "p1")
        XCTAssertEqual(inst.contained[1].id, "pr1")
        XCTAssertEqual(inst.contained[2].id, "pr2")
        XCTAssertEqual(inst.contained[3].id, "goal")
        XCTAssertEqual(inst.extension_fhir[0].url, "http://example.org/DoNotUse/careplan#lmp")
        XCTAssertEqual(inst.extension_fhir[0].valueDateTime?.description, "2013-01-01")
        XCTAssertEqual(inst.goal[0].reference, "#goal")
        XCTAssertEqual(inst.id, "preg")
        XCTAssertEqual(inst.participant[0].member?.display, "Mavis Midwife")
        XCTAssertEqual(inst.participant[0].member?.reference, "#pr1")
        XCTAssertEqual(inst.participant[0].role?.coding[0].code, "lmc")
        XCTAssertEqual(inst.participant[0].role?.coding[0].system, "http://example.org/mysys")
        XCTAssertEqual(inst.participant[0].role?.text, "Midwife")
        XCTAssertEqual(inst.participant[1].member?.display, "Oscar Obstetrician")
        XCTAssertEqual(inst.participant[1].member?.reference, "#pr2")
        XCTAssertEqual(inst.participant[1].role?.coding[0].code, "obs")
        XCTAssertEqual(inst.participant[1].role?.coding[0].system, "http://example.org/mysys")
        XCTAssertEqual(inst.participant[1].role?.text, "Obstretitian")
        XCTAssertEqual(inst.period?.end?.description, "2013-10-01")
        XCTAssertEqual(inst.period?.start?.description, "2013-01-01")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.subject?.display, "Eve Everywoman")
        XCTAssertEqual(inst.subject?.reference, "Patient/1")
        XCTAssertEqual(inst.text?.status, "additional")

        return inst
    }
    
    func testCarePlan10() {   
        var instance: FireKit.CarePlan?
        do {
            instance = try runCarePlan10()
            try runCarePlan10(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test CarePlan successfully, but threw: \(error)")
        }

        testCarePlanRealm10(instance!)
    }

    func testCarePlan10Copying() {
        do {
            let instance = try runCarePlan10()
            let copy = instance.copy() as? FireKit.CarePlan
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCarePlan10(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlan10Populatability() {
        do {
            let instance = try runCarePlan10()
            let copy = FireKit.CarePlan()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCarePlan10(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test CarePlan successfully, but threw: \(error)")
        }
    }

    func testCarePlanRealm10(_ instance: FireKit.CarePlan) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCarePlan10(JSONEncoder().encode(realm.objects(FireKit.CarePlan.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CarePlan.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CarePlan()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.CarePlan.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CarePlan.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CarePlan.self).count)
    }
    
    @discardableResult
    func runCarePlan10(_ data: Data? = nil) throws -> FireKit.CarePlan {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "careplan-example.json")
        
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].code, "observation")
        XCTAssertEqual(inst.activity[0].detail?.category?.coding[0].system, "http://hl7.org/fhir/care-plan-activity-category")
        XCTAssertEqual(inst.activity[0].detail?.code?.text, "a code for weight measurement")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].display, "Peter James Chalmers")
        XCTAssertEqual(inst.activity[0].detail?.performer[0].reference, "Patient/example")
        XCTAssertFalse(inst.activity[0].detail?.prohibited.value ?? true)
        XCTAssertEqual(inst.activity[0].detail?.scheduledTiming?.repeat_fhir?.frequency.value, 1)
        XCTAssertTrue(inst.activity[0].detail?.scheduledTiming?.repeat_fhir?.period! == RealmDecimal(string: "1"))
        XCTAssertEqual(inst.activity[0].detail?.scheduledTiming?.repeat_fhir?.periodUnits, "d")
        XCTAssertEqual(inst.addresses[0].display, "obesity")
        XCTAssertEqual(inst.addresses[0].reference, "#p1")
        XCTAssertEqual(inst.contained[0].id, "p1")
        XCTAssertEqual(inst.contained[1].id, "pr1")
        XCTAssertEqual(inst.contained[2].id, "goal")
        XCTAssertEqual(inst.goal[0].reference, "#goal")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.participant[0].member?.display, "Peter James Chalmers")
        XCTAssertEqual(inst.participant[0].member?.reference, "Patient/example")
        XCTAssertEqual(inst.participant[0].role?.text, "responsiblePerson")
        XCTAssertEqual(inst.participant[1].member?.display, "Dorothy Dietition")
        XCTAssertEqual(inst.participant[1].member?.reference, "#pr1")
        XCTAssertEqual(inst.participant[1].role?.text, "adviser")
        XCTAssertEqual(inst.period?.end?.description, "2013-01-01")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.subject?.display, "Peter James Chalmers")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.status, "additional")

        return inst
    }
}