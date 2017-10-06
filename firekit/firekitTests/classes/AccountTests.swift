//
//  AccountTests.swift
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


class AccountTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Account {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Account {
        // print("Inflating FireKit.Account from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Account.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testAccount1() {   
        var instance: FireKit.Account?
        do {
            instance = try runAccount1()
            try runAccount1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Account successfully, but threw: \(error)")
        }

        testAccountRealm1(instance!)
    }

    func testAccount1Copying() {
        do {
            let instance = try runAccount1()
            let copy = instance.copy() as? FireKit.Account
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runAccount1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Account successfully, but threw: \(error)")
        }
    }

    func testAccount1Populatability() {
        do {
            let instance = try runAccount1()
            let copy = FireKit.Account()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runAccount1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Account successfully, but threw: \(error)")
        }
    }

    func testAccountRealm1(_ instance: FireKit.Account) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runAccount1(JSONEncoder().encode(realm.objects(FireKit.Account.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Account.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Account.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Account()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Account.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Account.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Account.self).count)
    }
    
    @discardableResult
    func runAccount1(_ data: Data? = nil) throws -> FireKit.Account {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "account-example.json")
        
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}