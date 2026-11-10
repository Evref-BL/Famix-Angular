"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `ast` | `FamixAngularType` | `angularType` | `FASTTypeScriptProgram` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `implementingClass` | `FamixAngularType` | `angularType` | `FamixTypeScriptClass` | |
| `injectedServices` | `FamixAngularType` | `injectingClients` | `FamixAngularService` | |



"
Class {
	#name : 'FamixAngularType',
	#superclass : 'FamixAngularEntity',
	#instVars : [
		'#injectedServices => FMMany type: #FamixAngularService opposite: #injectingClients'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularType class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Type super: #FamixAngularEntity>
	<package: #'Famix-Angular-Entities'>
	<generated>
]

{ #category : 'adding' }
FamixAngularType >> addInjectedService: anObject [

	<ignoreForCoverage>
	<generated>
	^ self injectedServices add: anObject
]

{ #category : 'accessing' }
FamixAngularType >> ast [
	"Relation named: #ast type: #FASTTypeScriptProgram opposite: #angularType"

	<ignoreForCoverage>
	<generated>
	<FMProperty: #ast type: #FASTTypeScriptProgram opposite: #angularType>
	^ self attributeAt: #ast ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixAngularType >> ast: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #ast ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ast.
		self attributeAt: #ast put: anObject.
		otherSide angularType: nil ]
	ifNotNil: [ 
		self attributeAt: #ast put: anObject.
		anObject angularType: self ]
]

{ #category : 'accessing' }
FamixAngularType >> implementingClass [
	"Relation named: #implementingClass type: #FamixTypeScriptClass opposite: #angularType"

	<ignoreForCoverage>
	<generated>
	<FMProperty: #implementingClass type: #FamixTypeScriptClass opposite: #angularType>
	^ self attributeAt: #implementingClass ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixAngularType >> implementingClass: anObject [

	<ignoreForCoverage>
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
FamixAngularType >> injectedServices [
	"Relation named: #injectedServices type: #FamixAngularService opposite: #injectingClients"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ injectedServices
]

{ #category : 'accessing' }
FamixAngularType >> injectedServices: anObject [

	<ignoreForCoverage>
	<generated>
	injectedServices value: anObject
]
