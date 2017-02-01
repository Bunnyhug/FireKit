//
//  AccountTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class AccountTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Account {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Account {
		let instance = RealmSwiftFHIR.Account(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testAccount1() {		
		var instance: RealmSwiftFHIR.Account?
		do {
			instance = try runAccount1()
			try runAccount1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Account successfully, but threw")
		}

		testAccountRealm1(instance: instance!)
	}

	func testAccountRealm1(instance: RealmSwiftFHIR.Account) {
		try! realm.write {
                realm.add(instance)
            }
        try! runAccount1(realm.objects(RealmSwiftFHIR.Account.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Account.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Account.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runAccount1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Account {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "account-example.json")
		
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
