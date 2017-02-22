[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# Table of Contents
- [Introduction](#realmswiftfhir)
- [Installation](#installation)
	- [Carthage](#carthage)
	- [Clone 'n Build](#clone-n-build)
- [Versioning](#versioning)
- [Modifying RealmSwiftFHIR](#modifying-realmswiftfhir)
- [What's Distinct to RealmSwiftFHIR](#whats-distinct-to-realmswiftfhir)
	- [RealmSwift.Object](#realmswift-object)
	- [Primary Keys](#primary-keys)
	- [RealmList vs. Arrays](#realmlist-vs-arrays)
	- [RealmOptional vs. Optional Primitives](#realmoptional-vs-optional-primitives)
	- [JSON Serialization](#json-serialization)
	- [Upsert](#upsert)
- [State of the Union](#state-of-the-union)

# RealmSwiftFHIR
RealmSwiftFHIR is an adaptation of [smart-on-fhir/Swift-FHIR](https://github.com/smart-on-fhir/Swift-FHIR/), with one notable difference: All FHIR Resources and Elements support [Realm](https://realm.io) for data persistence.

```Swift
import RealmSwiftFHIR


// You can hydrate a patient with some JSON from your FHIR Server and 
// natively save it to a Realm
let realm = Realm()
let patientResponseJSON = someMagicalFHIREndpoint(patientId: 123)
let patient = Patient(json: patientResponseJSON)
try! realm.write { realm.add(patient) }
 
// Alternatively you can Create your own patient
let sickMan = Patient()
sickMan.gender = "M"
sickMan.name.append(HumanName())
sickman.name[0].given.append(val: "Joey")
sickman.name[0].family.append(val: "Baloney")
try! realm.write { realm.add(sickMan) }

// You can update properties on your realm object as you normally would
 try! realm.write {
 	sickMan.name[0].given.value = "Joseph"
 	sickMan.name[0].family.value = "Balogna"
 }

// And of course, you can query for your Patient
let joeys = realm.objects(Patient.self).filter {
	$0.name.filter {
		$0.given.filter {
			$0.value == "Joseph"
		}.count > 0
	}.count > 0
}

// You can also fetch a patient by its ID (not guaranteed to be unique in RealmSwiftFHIR)
let lonelyJoey = realm.objects(Patient.self).filter("id = %@", "123").first // returns Patient?

// Or you can fetch a patient by it's RealmSwiftFHIR local primary key
let THEJoey = realm.object(ofType: Patient.self, forPrimaryKey: lonelyJoey?.pk)

// You can create an unmanaged duplicate by simply calling `copy`
// This is convenient if you have a ViewController which operates over
// a lot of the fields of a FHIR resource, and you don't want to continuously 
// modify each field in the managed resource in a write transaction.
let twinJoey = lonelyJoey?.copy() as! Patient
twinJoey.name[0].given[0].value = "Joe"
twinJoey.name[0].family[0].value = "MysteryMeat"

// You can populate an existing instance with data from another instance
// This will overwrite all data in the target instance. 
// You would do this to get the changes from your unamanged (e.g. _twinJoey_ above)
// back into the managed instance.
try! realm.write { lonelyJoey?.populate(from: twinJoey) }
```

Checkout [the original Swift-FHIR project](https://github.com/smart-on-fhir/Swift-FHIR/) for  details on the Swift-FHIR library itself.

# Installation
You have 2 options: 

1. [Carthage](https://github.com/Carthage/Carthage) (which will download the binaries attached to the appropriate Release)
2. Good ol' fashioned Clone 'n Build.

## Carthage
1. [Install Carthage](https://github.com/Carthage/Carthage), if you haven't already.
2. Add `github "ryanbaldwin/RealmSwiftFHIR" == 0.2.1` to the appropriate `Cartfile`
3. Do a quick `carthage update` and add the [framework to your project](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) as you normally would.
4. Build a kick ass health app and never worry about your datamodel again.

## Clone 'n Build
1. [Install Carthage](https://github.com/Carthage/Carthage), if you haven't already.
2. Clone this repo.
3. `cd` into the `realm-swift-fhir` project directory where the various `Cartfile`s reside.
4. run `./xcarthage bootstrap` to download the dependencies, both binary and external projects such as [Pascal Pfiffner](https://github.com/p2)'s `fhir-parser` (which does the actual parsing)
5. Open the `realm-swift-fhir.xcworkspace`
6. Build and run the tests as you would for any other Xcode project.

# Modifying RealmSwiftFHIR
All classes and tests in RealmSwiftFHIR are generated using [Pascal Pfiffner](https://github.com/p2)'s [smart-on-fhir/fhir-parser](https://github.com/smart-on-fhir/fhir-parser) and some old Swift3 templates he once had which I modified. Therefore, if you're interested in modifying the classes/tests, then it's best to modify the templates and re-generate the `*.swift` files.

The templates can be found in the `fhir-parser-resources/FHIR-1.6.0` directory. The main file's you'll be looking at modifying are:
 - `template-resource.swift`
 - `template-unittest.swift`

After making the changes you want (or didn't mean to make), you can re-generate _all_ the files by simply running the `./generate` script. This is an all or nothing Royal Rumble of code generation, and absolutely all `.swift` files will be overwritten. It is unapologetic in its aggressiveness. It cares not about your feelings. It is death, and it comes for your files.
> Learn more about [Pascal Pfiffner](https://github.com/p2)'s [smart-on-fhir/fhir-parser](https://github.com/smart-on-fhir/fhir-parser) by visiting its repo.

# Versioning
Current of `RealmSmartFHIR` is `v0.2.2` and is based on the [FHIR DSTU2 spec](https://www.hl7.org/fhir/DSTU2/).

# What's Distinct to RealmSwiftFHIR
While most of RealmSwiftFHIR follows as closely as possible to [smart-on-fhir/Swift-FHIR](https://github.com/smart-on-fhir/Swift-FHIR)'s original implementation, certain provision had to be made in order to accomodate Realm.

## RealmSwift.Object
Everything ultimately inherits from a `RealmSwift.Object`. This is the secret sauce for persistence. This includes all Resources and Elements.

## Primary Keys
All FHIR Resource and Element types have a `pk` field on them, which defaults to a `UUID().uuidString` value. These `pk` fields are designated as the PrimaryKeys for Realm. You can change this value so long as the object upon which you're acting has not already been saved (i.e. the object is _unmanaged_, in the parlance of Realm).

## RealmList vs. Arrays
All Swift-FHIR array properties (such as `Patient.name: [HumanName]`) have been replaced with `RealmList<>` properties (such as `Patient.name = RealmList<HumanName>()`). This facilitates the one-to-many relationships in Realm.

Furthermore, Realm does not support RealmList's of primitives. As a result, what would normally be `[String]` in Swift-FHIR, is now `RealmList<RealmString>`; `[Int]` is now `RealmList<RealmInt>`, and so on. Each `Realm*` type has a single property, `value`, which contains the actual value. 

## RealmOptional vs. Optional Primitives
Realm straight up doesn't support optionals beyond `String?`, `Date?`, and `Data?`. As a result, What would normally be `Bool?` in Realm-FHIR, is a wrapped `RealmOptional<Bool>` in RealmSwiftFHIR; `Int?` is now `RealmOptional<Int>`, and so on. 

Each [`RealmOptional<T>`](https://realm.io/docs/swift/latest/api/Classes/RealmOptional.html) has a `value: T?` within.

## JSON Serialization
Two worthy notes about JSON Serialization:
	1. The `pk` field is _never_ serialized. It stays local. What happens in Vegas, stays in Vegas.
	2. When populating a managed instance via `instance.populate(from: FHIRJSON)`, any element list types (such as `Patient.name`) will be completely deleted from the Realm, and re-created on the fly. There are 2 reasons for this:
		i. There is no reliable way to tell what has been added/removed/updated between the JSON and the Elements, and
		ii. Elements are only valid within the context of their Resource.

Moral of the story: Do not let multiple Resources point to the same managed Element instance (e.g. 2 `Patient` managed instances each pointing to the same `HumanName` realm instance.)

## Upsert
This whole "Don't share the element primary keys" business can be a total pain in the ass. As a result, the easiest way to assign an Element value to a Resource element property is to use the associated `upsert` function. 

Each non-list Element property on a Resource has an `upsert` function, with a parameter label of the same name as the property. For example, the `Patient` class has the following:

```Swift
public dynamic var animal: PatientAnimal?        
public func upsert(animal: PatientAnimal?)

public dynamic var managingOrganization: Reference?
public func upsert(managingOrganization: Reference?)
```

These `upsert` functions will manage the primary key for you. So don't sweat it, just upsert it... yea, that was kinda lame but hey.

# State of the Union
RealmSwiftFHIR should be considered a Work In Progress. I've only just started using it in a real world project, and am dogfooding and actively fixing bugs, making improvements, etc. as required. Use this at your own risk, but it should be fine, but use it at your own risk.

If you find any bugs or have any enhancements, ideas, questions, etc. Create an issue. Or, better yet, create a pull request and give it some love.
