//
//  QuestionnaireTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-03-28.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class QuestionnaireTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Questionnaire {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Questionnaire {
		let instance = RealmSwiftFHIR.Questionnaire(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testQuestionnaire1() {		
		var instance: RealmSwiftFHIR.Questionnaire?
		do {
			instance = try runQuestionnaire1()
			try runQuestionnaire1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Questionnaire
			XCTAssertNotNil(copy)
			try runQuestionnaire1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runQuestionnaire1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Questionnaire successfully, but threw")
		}

		testQuestionnaireRealm1(instance: instance!)
	}

    func testQuestionnaire1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Questionnaire = try runQuestionnaire1()
            let copy = (instance.copy() as! RealmSwiftFHIR.Questionnaire)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Questionnaire's PKs, but threw: \(error)")
        }
    }

	func testQuestionnaireRealm1(instance: RealmSwiftFHIR.Questionnaire) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runQuestionnaire1(realm.objects(RealmSwiftFHIR.Questionnaire.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Questionnaire.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Questionnaire()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Questionnaire.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaire1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Questionnaire.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaire1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)
	}
	
	@discardableResult
	func runQuestionnaire1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Questionnaire {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "questionnaire-example-bluebook.json")
		
		XCTAssertEqual(inst.date?.description, "2013-02-19")
		XCTAssertEqual(inst.group?.group[0].group[0].question[0].linkId, "nameOfChild")
		XCTAssertEqual(inst.group?.group[0].group[0].question[0].text, "Name of child")
		XCTAssertEqual(inst.group?.group[0].group[0].question[1].linkId, "sex")
		XCTAssertEqual(inst.group?.group[0].group[0].question[1].text, "Sex")
		XCTAssertEqual(inst.group?.group[0].group[1].linkId, "neonatalInformation")
		XCTAssertEqual(inst.group?.group[0].group[1].question[0].linkId, "birthWeight")
		XCTAssertEqual(inst.group?.group[0].group[1].question[0].text, "Birth weight (kg)")
		XCTAssertEqual(inst.group?.group[0].group[1].question[1].linkId, "birthLength")
		XCTAssertEqual(inst.group?.group[0].group[1].question[1].text, "Birth length (cm)")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].group[0].extension_fhir[0].url, "http://example.org/Profile/questionnaire#visibilityCondition")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].group[0].extension_fhir[0].valueString, "HAS_VALUE(../choice/code) AND NEQ(../choice/code,'NO')")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].group[0].linkId, "vitaminKgivenDoses")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].group[0].question[0].linkId, "vitaminiKDose1")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].group[0].question[0].text, "1st dose")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].group[0].question[1].linkId, "vitaminiKDose2")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].group[0].question[1].text, "2nd dose")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].linkId, "vitaminKgiven")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].text, "Vitamin K given")
		XCTAssertEqual(inst.group?.group[0].group[1].question[3].group[0].question[0].linkId, "hepBgivenDate")
		XCTAssertEqual(inst.group?.group[0].group[1].question[3].group[0].question[0].text, "Date given")
		XCTAssertEqual(inst.group?.group[0].group[1].question[3].linkId, "hepBgiven")
		XCTAssertEqual(inst.group?.group[0].group[1].question[3].text, "Hep B given y / n")
		XCTAssertEqual(inst.group?.group[0].group[1].question[4].linkId, "abnormalitiesAtBirth")
		XCTAssertEqual(inst.group?.group[0].group[1].question[4].text, "Abnormalities noted at birth")
		XCTAssertEqual(inst.group?.group[0].group[1].title, "Neonatal Information")
		XCTAssertEqual(inst.group?.group[0].linkId, "birthDetails")
		XCTAssertEqual(inst.group?.group[0].title, "Birth details - To be completed by health professional")
		XCTAssertEqual(inst.group?.linkId, "PHR")
		XCTAssertTrue(inst.group?.required.value ?? false)
		XCTAssertEqual(inst.group?.title, "NSW Government My Personal Health Record")
		XCTAssertEqual(inst.id, "bb")
		XCTAssertEqual(inst.publisher, "New South Wales Department of Health")
		XCTAssertEqual(inst.status, "draft")
		XCTAssertEqual(inst.subjectType[0].value, "Patient")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testQuestionnaire2() {		
		var instance: RealmSwiftFHIR.Questionnaire?
		do {
			instance = try runQuestionnaire2()
			try runQuestionnaire2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Questionnaire
			XCTAssertNotNil(copy)
			try runQuestionnaire2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runQuestionnaire2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Questionnaire successfully, but threw")
		}

		testQuestionnaireRealm2(instance: instance!)
	}

    func testQuestionnaire2RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Questionnaire = try runQuestionnaire2()
            let copy = (instance.copy() as! RealmSwiftFHIR.Questionnaire)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Questionnaire's PKs, but threw: \(error)")
        }
    }

	func testQuestionnaireRealm2(instance: RealmSwiftFHIR.Questionnaire) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runQuestionnaire2(realm.objects(RealmSwiftFHIR.Questionnaire.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Questionnaire.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Questionnaire()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Questionnaire.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaire2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Questionnaire.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaire2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)
	}
	
	@discardableResult
	func runQuestionnaire2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Questionnaire {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "questionnaire-example-f201-lifelines.json")
		
		XCTAssertEqual(inst.date?.description, "2010")
		XCTAssertEqual(inst.group?.concept[0].code, "VL 1-1, 18-65_1.2.2")
		XCTAssertEqual(inst.group?.concept[0].display, "Lifelines Questionnaire 1 part 1")
		XCTAssertEqual(inst.group?.concept[0].system, "http://example.org/system/code/lifelines/nl")
		XCTAssertEqual(inst.group?.group[0].linkId, "1")
		XCTAssertEqual(inst.group?.group[0].question[0].linkId, "1.1")
		XCTAssertEqual(inst.group?.group[0].question[0].text, "Do you have allergies?")
		XCTAssertEqual(inst.group?.group[1].linkId, "2")
		XCTAssertEqual(inst.group?.group[1].question[0].linkId, "2.1")
		XCTAssertEqual(inst.group?.group[1].question[0].text, "What is your gender?")
		XCTAssertEqual(inst.group?.group[1].question[1].linkId, "2.2")
		XCTAssertEqual(inst.group?.group[1].question[1].text, "What is your date of birth?")
		XCTAssertEqual(inst.group?.group[1].question[2].linkId, "2.3")
		XCTAssertEqual(inst.group?.group[1].question[2].text, "What is your country of birth?")
		XCTAssertEqual(inst.group?.group[1].question[3].linkId, "2.4")
		XCTAssertEqual(inst.group?.group[1].question[3].text, "What is your marital status?")
		XCTAssertEqual(inst.group?.group[1].text, "General questions")
		XCTAssertEqual(inst.group?.group[2].linkId, "3")
		XCTAssertEqual(inst.group?.group[2].question[0].linkId, "3.1")
		XCTAssertEqual(inst.group?.group[2].question[0].text, "Do you smoke?")
		XCTAssertEqual(inst.group?.group[2].question[1].linkId, "3.2")
		XCTAssertEqual(inst.group?.group[2].question[1].text, "Do you drink alchohol?")
		XCTAssertEqual(inst.group?.group[2].title, "Intoxications")
		XCTAssertEqual(inst.group?.linkId, "root")
		XCTAssertTrue(inst.group?.required.value ?? false)
		XCTAssertEqual(inst.id, "f201")
		XCTAssertEqual(inst.status, "published")
		XCTAssertEqual(inst.subjectType[0].value, "Patient")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testQuestionnaire3() {		
		var instance: RealmSwiftFHIR.Questionnaire?
		do {
			instance = try runQuestionnaire3()
			try runQuestionnaire3(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Questionnaire
			XCTAssertNotNil(copy)
			try runQuestionnaire3(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runQuestionnaire3(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Questionnaire successfully, but threw")
		}

		testQuestionnaireRealm3(instance: instance!)
	}

    func testQuestionnaire3RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Questionnaire = try runQuestionnaire3()
            let copy = (instance.copy() as! RealmSwiftFHIR.Questionnaire)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Questionnaire's PKs, but threw: \(error)")
        }
    }

	func testQuestionnaireRealm3(instance: RealmSwiftFHIR.Questionnaire) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runQuestionnaire3(realm.objects(RealmSwiftFHIR.Questionnaire.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Questionnaire.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Questionnaire()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Questionnaire.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaire3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Questionnaire.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaire3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)
	}
	
	@discardableResult
	func runQuestionnaire3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Questionnaire {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "questionnaire-example-gcs.json")
		
		XCTAssertEqual(inst.contained[0].id, "motor")
		XCTAssertEqual(inst.contained[1].id, "verbal")
		XCTAssertEqual(inst.contained[2].id, "eye")
		XCTAssertEqual(inst.date?.description, "2015-08-03")
		XCTAssertEqual(inst.group?.concept[0].code, "9269-2")
		XCTAssertEqual(inst.group?.concept[0].system, "http://loinc.org")
		XCTAssertEqual(inst.group?.linkId, "1")
		XCTAssertEqual(inst.group?.question[0].concept[0].code, "9270-0")
		XCTAssertEqual(inst.group?.question[0].concept[0].system, "http://loinc.org")
		XCTAssertEqual(inst.group?.question[0].linkId, "1.1")
		XCTAssertEqual(inst.group?.question[0].options?.reference, "#verbal")
		XCTAssertEqual(inst.group?.question[0].type, "choice")
		XCTAssertEqual(inst.group?.question[1].concept[0].code, "9268-4")
		XCTAssertEqual(inst.group?.question[1].concept[0].system, "http://loinc.org")
		XCTAssertEqual(inst.group?.question[1].linkId, "1.2")
		XCTAssertEqual(inst.group?.question[1].options?.reference, "#motor")
		XCTAssertEqual(inst.group?.question[1].type, "choice")
		XCTAssertEqual(inst.group?.question[2].concept[0].code, "9267-6")
		XCTAssertEqual(inst.group?.question[2].concept[0].system, "http://loinc.org")
		XCTAssertEqual(inst.group?.question[2].linkId, "1.3")
		XCTAssertEqual(inst.group?.question[2].options?.reference, "#eye")
		XCTAssertEqual(inst.group?.question[2].type, "choice")
		XCTAssertTrue(inst.group?.required.value ?? false)
		XCTAssertEqual(inst.group?.title, "Glasgow Coma Score")
		XCTAssertEqual(inst.id, "gcs")
		XCTAssertEqual(inst.publisher, "FHIR Project team")
		XCTAssertEqual(inst.status, "draft")
		XCTAssertEqual(inst.subjectType[0].value, "Patient")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testQuestionnaire4() {		
		var instance: RealmSwiftFHIR.Questionnaire?
		do {
			instance = try runQuestionnaire4()
			try runQuestionnaire4(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Questionnaire
			XCTAssertNotNil(copy)
			try runQuestionnaire4(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runQuestionnaire4(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Questionnaire successfully, but threw")
		}

		testQuestionnaireRealm4(instance: instance!)
	}

    func testQuestionnaire4RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Questionnaire = try runQuestionnaire4()
            let copy = (instance.copy() as! RealmSwiftFHIR.Questionnaire)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Questionnaire's PKs, but threw: \(error)")
        }
    }

	func testQuestionnaireRealm4(instance: RealmSwiftFHIR.Questionnaire) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runQuestionnaire4(realm.objects(RealmSwiftFHIR.Questionnaire.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Questionnaire.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Questionnaire()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Questionnaire.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaire4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Questionnaire.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaire4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Questionnaire.self).count)
	}
	
	@discardableResult
	func runQuestionnaire4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Questionnaire {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "questionnaire-example.json")
		
		XCTAssertEqual(inst.contained[0].id, "yesno")
		XCTAssertEqual(inst.date?.description, "2012-01")
		XCTAssertEqual(inst.group?.group[0].concept[0].code, "COMORBIDITY")
		XCTAssertEqual(inst.group?.group[0].concept[0].system, "http://example.org/system/code/sections")
		XCTAssertEqual(inst.group?.group[0].linkId, "1.1")
		XCTAssertEqual(inst.group?.group[0].question[0].concept[0].code, "COMORB")
		XCTAssertEqual(inst.group?.group[0].question[0].concept[0].system, "http://example.org/system/code/questions")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].concept[0].code, "CARDIAL")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].concept[0].system, "http://example.org/system/code/sections")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].linkId, "1.1.1.1")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[0].concept[0].code, "COMORBCAR")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[0].concept[0].system, "http://example.org/system/code/questions")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[0].linkId, "1.1.1.1.1")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[0].options?.reference, "#yesno")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[0].type, "choice")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[1].concept[0].code, "COMCAR00")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[1].concept[0].display, "Angina Pectoris")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[1].concept[0].system, "http://example.org/system/code/questions")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[1].concept[1].code, "194828000")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[1].concept[1].display, "Angina (disorder)")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[1].concept[1].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[1].linkId, "1.1.1.1.2")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[1].options?.reference, "#yesno")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[1].type, "choice")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[2].concept[0].code, "22298006")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[2].concept[0].display, "Myocardial infarction (disorder)")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[2].concept[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[2].linkId, "1.1.1.1.3")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[2].options?.reference, "#yesno")
		XCTAssertEqual(inst.group?.group[0].question[0].group[0].question[2].type, "choice")
		XCTAssertEqual(inst.group?.group[0].question[0].group[1].concept[0].code, "VASCULAR")
		XCTAssertEqual(inst.group?.group[0].question[0].group[1].concept[0].system, "http://example.org/system/code/sections")
		XCTAssertEqual(inst.group?.group[0].question[0].group[1].linkId, "1.1.1.2")
		XCTAssertEqual(inst.group?.group[0].question[0].linkId, "1.1.1")
		XCTAssertEqual(inst.group?.group[0].question[0].options?.reference, "#yesno")
		XCTAssertEqual(inst.group?.group[0].question[0].type, "choice")
		XCTAssertEqual(inst.group?.group[1].concept[0].code, "HISTOPATHOLOGY")
		XCTAssertEqual(inst.group?.group[1].concept[0].system, "http://example.org/system/code/sections")
		XCTAssertEqual(inst.group?.group[1].group[0].concept[0].code, "ABDOMINAL")
		XCTAssertEqual(inst.group?.group[1].group[0].concept[0].system, "http://example.org/system/code/sections")
		XCTAssertEqual(inst.group?.group[1].group[0].linkId, "1.2.1")
		XCTAssertEqual(inst.group?.group[1].group[0].question[0].concept[0].code, "STADPT")
		XCTAssertEqual(inst.group?.group[1].group[0].question[0].concept[0].display, "pT category")
		XCTAssertEqual(inst.group?.group[1].group[0].question[0].concept[0].system, "http://example.org/system/code/questions")
		XCTAssertEqual(inst.group?.group[1].group[0].question[0].linkId, "1.2.1.2")
		XCTAssertEqual(inst.group?.group[1].linkId, "1.2")
		XCTAssertEqual(inst.group?.linkId, "1")
		XCTAssertTrue(inst.group?.required.value ?? false)
		XCTAssertEqual(inst.group?.title, "Cancer Quality Forum Questionnaire 2012")
		XCTAssertEqual(inst.id, "3141")
		XCTAssertEqual(inst.status, "draft")
		XCTAssertEqual(inst.subjectType[0].value, "Patient")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
