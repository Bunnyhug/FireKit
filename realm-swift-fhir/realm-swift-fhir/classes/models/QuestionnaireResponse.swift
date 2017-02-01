//
//  QuestionnaireResponse.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse) on 2017-02-01.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A structured set of questions and their answers.
 *
 *  A structured set of questions and their answers. The questions are ordered and grouped into coherent subsets,
 *  corresponding to the structure of the grouping of the underlying questions.
 */
open class QuestionnaireResponse: DomainResource {
	override open class var resourceType: String {
		get { return "QuestionnaireResponse" }
	}

	public dynamic var author: Reference?
	
	public dynamic var authored: DateTime?
	
	public dynamic var encounter: Reference?
	
	public dynamic var group: QuestionnaireResponseGroup?
	
	public dynamic var identifier: Identifier?
	
	public dynamic var questionnaire: Reference?
	
	public dynamic var source: Reference?
	
	public dynamic var status: String?
	
	public dynamic var subject: Reference?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(status: String) {
		self.init(json: nil)
		self.status = status
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["author"] {
				presentKeys.insert("author")
				if let val = exist as? FHIRJSON {
					self.author = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["authored"] {
				presentKeys.insert("authored")
				if let val = exist as? String {
					self.authored = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "authored", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					self.encounter = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["group"] {
				presentKeys.insert("group")
				if let val = exist as? FHIRJSON {
					self.group = QuestionnaireResponseGroup(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "group", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					self.identifier = Identifier(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["questionnaire"] {
				presentKeys.insert("questionnaire")
				if let val = exist as? FHIRJSON {
					self.questionnaire = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "questionnaire", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["source"] {
				presentKeys.insert("source")
				if let val = exist as? FHIRJSON {
					self.source = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "source", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["status"] {
				presentKeys.insert("status")
				if let val = exist as? String {
					self.status = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "status", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "status"))
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					self.subject = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let author = self.author {
			json["author"] = author.asJSON()
		}
		if let authored = self.authored {
			json["authored"] = authored.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if let group = self.group {
			json["group"] = group.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let questionnaire = self.questionnaire {
			json["questionnaire"] = questionnaire.asJSON()
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		
		return json
	}
}


/**
 *  Grouped questions.
 *
 *  A group of questions to a possibly similarly grouped set of questions in the questionnaire response.
 */
open class QuestionnaireResponseGroup: BackboneElement {
	override open class var resourceType: String {
		get { return "QuestionnaireResponseGroup" }
	}

	public let group = RealmSwift.List<QuestionnaireResponseGroup>()
	
	public dynamic var linkId: String?
	
	public let question = RealmSwift.List<QuestionnaireResponseGroupQuestion>()
	
	public dynamic var subject: Reference?
	
	public dynamic var text: String?
	
	public dynamic var title: String?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["group"] {
				presentKeys.insert("group")
				if let val = exist as? [FHIRJSON] {
					if let vals = QuestionnaireResponseGroup.instantiate(fromArray: val, owner: self) as? [QuestionnaireResponseGroup] {
						self.group.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "group", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["linkId"] {
				presentKeys.insert("linkId")
				if let val = exist as? String {
					self.linkId = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "linkId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["question"] {
				presentKeys.insert("question")
				if let val = exist as? [FHIRJSON] {
					if let vals = QuestionnaireResponseGroupQuestion.instantiate(fromArray: val, owner: self) as? [QuestionnaireResponseGroupQuestion] {
						self.question.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "question", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					self.subject = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["title"] {
				presentKeys.insert("title")
				if let val = exist as? String {
					self.title = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "title", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if group.count > 0 {
			json["group"] = Array(group.map() { $0.asJSON() })
		}
		if let linkId = self.linkId {
			json["linkId"] = linkId.asJSON()
		}
		if question.count > 0 {
			json["question"] = Array(question.map() { $0.asJSON() })
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let title = self.title {
			json["title"] = title.asJSON()
		}
		
		return json
	}
}


/**
 *  Questions in this group.
 *
 *  Set of questions within this group. The order of questions within the group is relevant.
 */
open class QuestionnaireResponseGroupQuestion: BackboneElement {
	override open class var resourceType: String {
		get { return "QuestionnaireResponseGroupQuestion" }
	}

	public let answer = RealmSwift.List<QuestionnaireResponseGroupQuestionAnswer>()
	
	public dynamic var linkId: String?
	
	public dynamic var text: String?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["answer"] {
				presentKeys.insert("answer")
				if let val = exist as? [FHIRJSON] {
					if let vals = QuestionnaireResponseGroupQuestionAnswer.instantiate(fromArray: val, owner: self) as? [QuestionnaireResponseGroupQuestionAnswer] {
						self.answer.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "answer", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["linkId"] {
				presentKeys.insert("linkId")
				if let val = exist as? String {
					self.linkId = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "linkId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if answer.count > 0 {
			json["answer"] = Array(answer.map() { $0.asJSON() })
		}
		if let linkId = self.linkId {
			json["linkId"] = linkId.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		
		return json
	}
}


/**
 *  The response(s) to the question.
 *
 *  The respondent's answer(s) to the question.
 */
open class QuestionnaireResponseGroupQuestionAnswer: BackboneElement {
	override open class var resourceType: String {
		get { return "QuestionnaireResponseGroupQuestionAnswer" }
	}

	public let group = RealmSwift.List<QuestionnaireResponseGroup>()
	
	public dynamic var valueAttachment: Attachment?
	
	public let valueBoolean = RealmOptional<Bool>()
	
	public dynamic var valueCoding: Coding?
	
	public dynamic var valueDate: FHIRDate?
	
	public dynamic var valueDateTime: DateTime?
	
	public dynamic var valueDecimal: RealmDecimal?
	
	public dynamic var valueInstant: Instant?
	
	public let valueInteger = RealmOptional<Int>()
	
	public dynamic var valueQuantity: Quantity?
	
	public dynamic var valueReference: Reference?
	
	public dynamic var valueString: String?
	
	public dynamic var valueTime: FHIRTime?
	
	public dynamic var valueUri: String?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["group"] {
				presentKeys.insert("group")
				if let val = exist as? [FHIRJSON] {
					if let vals = QuestionnaireResponseGroup.instantiate(fromArray: val, owner: self) as? [QuestionnaireResponseGroup] {
						self.group.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "group", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueAttachment"] {
				presentKeys.insert("valueAttachment")
				if let val = exist as? FHIRJSON {
					self.valueAttachment = Attachment(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "valueAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueBoolean"] {
				presentKeys.insert("valueBoolean")
				if let val = exist as? Bool {
					self.valueBoolean.value = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "valueBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueCoding"] {
				presentKeys.insert("valueCoding")
				if let val = exist as? FHIRJSON {
					self.valueCoding = Coding(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "valueCoding", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueDate"] {
				presentKeys.insert("valueDate")
				if let val = exist as? String {
					self.valueDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueDateTime"] {
				presentKeys.insert("valueDateTime")
				if let val = exist as? String {
					self.valueDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueDecimal"] {
				presentKeys.insert("valueDecimal")
				if let val = exist as? NSNumber {
					self.valueDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueInstant"] {
				presentKeys.insert("valueInstant")
				if let val = exist as? String {
					self.valueInstant = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueInstant", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueInteger"] {
				presentKeys.insert("valueInteger")
				if let val = exist as? Int {
					self.valueInteger.value = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "valueInteger", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueQuantity"] {
				presentKeys.insert("valueQuantity")
				if let val = exist as? FHIRJSON {
					self.valueQuantity = Quantity(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "valueQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueReference"] {
				presentKeys.insert("valueReference")
				if let val = exist as? FHIRJSON {
					self.valueReference = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "valueReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueString"] {
				presentKeys.insert("valueString")
				if let val = exist as? String {
					self.valueString = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "valueString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueTime"] {
				presentKeys.insert("valueTime")
				if let val = exist as? String {
					self.valueTime = FHIRTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueUri"] {
				presentKeys.insert("valueUri")
				if let val = exist as? String {
					self.valueUri = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "valueUri", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if group.count > 0 {
			json["group"] = Array(group.map() { $0.asJSON() })
		}
		if let valueAttachment = self.valueAttachment {
			json["valueAttachment"] = valueAttachment.asJSON()
		}
		if let valueBoolean = self.valueBoolean.value {
			json["valueBoolean"] = valueBoolean.asJSON()
		}
		if let valueCoding = self.valueCoding {
			json["valueCoding"] = valueCoding.asJSON()
		}
		if let valueDate = self.valueDate {
			json["valueDate"] = valueDate.asJSON()
		}
		if let valueDateTime = self.valueDateTime {
			json["valueDateTime"] = valueDateTime.asJSON()
		}
		if let valueDecimal = self.valueDecimal {
			json["valueDecimal"] = valueDecimal.asJSON()
		}
		if let valueInstant = self.valueInstant {
			json["valueInstant"] = valueInstant.asJSON()
		}
		if let valueInteger = self.valueInteger.value {
			json["valueInteger"] = valueInteger.asJSON()
		}
		if let valueQuantity = self.valueQuantity {
			json["valueQuantity"] = valueQuantity.asJSON()
		}
		if let valueReference = self.valueReference {
			json["valueReference"] = valueReference.asJSON()
		}
		if let valueString = self.valueString {
			json["valueString"] = valueString.asJSON()
		}
		if let valueTime = self.valueTime {
			json["valueTime"] = valueTime.asJSON()
		}
		if let valueUri = self.valueUri {
			json["valueUri"] = valueUri.asJSON()
		}
		
		return json
	}
}

