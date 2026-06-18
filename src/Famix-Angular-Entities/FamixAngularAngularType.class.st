"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `implementingClass` | `FamixAngularAngularType` | `angularType` | `FamixTypeScriptClass` | |
| `injectedServices` | `FamixAngularAngularType` | `injectingClients` | `FamixAngularService` | |



"
Class {
	#name : 'FamixAngularAngularType',
	#superclass : 'FamixAngularAngularEntity',
	#instVars : [
		'#injectedServices => FMMany type: #FamixAngularService opposite: #injectingClients'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularAngularType class >> annotation [

	<FMClass: #AngularType super: #FamixAngularAngularEntity>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixAngularAngularType >> addInjectedService: anObject [
	<generated>
	^ self injectedServices add: anObject
]

{ #category : 'accessing' }
FamixAngularAngularType >> implementingClass [
	"Relation named: #implementingClass type: #FamixTypeScriptClass opposite: #angularType"

	<generated>
	<FMProperty: #implementingClass type: #FamixTypeScriptClass opposite: #angularType>
	^ self attributeAt: #implementingClass ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixAngularAngularType >> implementingClass: anObject [

	<generated>
	(self attributeAt: #implementingClass ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self implementingClass.
		self attributeAt: #implementingClass put: anObject.
		otherSide angularType: nil ]
	ifNotNil: [ 
		self attributeAt: #implementingClass put: anObject.
		anObject angularType: self ]
]

{ #category : 'accessing' }
FamixAngularAngularType >> injectedServices [
	"Relation named: #injectedServices type: #FamixAngularService opposite: #injectingClients"

	<generated>
	<derived>
	^ injectedServices
]

{ #category : 'accessing' }
FamixAngularAngularType >> injectedServices: anObject [

	<generated>
	injectedServices value: anObject
]
