"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `ast` | `FamixAngularType` | `angularTemplate` | `FASTTypeScriptModel` | |

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

	<FMClass: #Type super: #FamixAngularEntity>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixAngularType >> addInjectedService: anObject [
	<generated>
	^ self injectedServices add: anObject
]

{ #category : 'accessing' }
FamixAngularType >> ast [
	"Relation named: #ast type: #FASTTypeScriptModel opposite: #angularTemplate"

	<generated>
	<FMProperty: #ast type: #FASTTypeScriptModel opposite: #angularTemplate>
	^ self attributeAt: #ast ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixAngularType >> ast: anObject [

	<generated>
	(self attributeAt: #ast ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ast.
		self attributeAt: #ast put: anObject.
		otherSide angularTemplate: nil ]
	ifNotNil: [ 
		self attributeAt: #ast put: anObject.
		anObject angularTemplate: self ]
]

{ #category : 'navigation' }
FamixAngularType >> astGroup [
	<generated>
	<navigation: 'Ast'>
	^ MooseSpecializedGroup with: self ast
]

{ #category : 'accessing' }
FamixAngularType >> implementingClass [
	"Relation named: #implementingClass type: #FamixTypeScriptClass opposite: #angularType"

	<generated>
	<FMProperty: #implementingClass type: #FamixTypeScriptClass opposite: #angularType>
	^ self attributeAt: #implementingClass ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixAngularType >> implementingClass: anObject [

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

	<generated>
	<derived>
	^ injectedServices
]

{ #category : 'accessing' }
FamixAngularType >> injectedServices: anObject [

	<generated>
	injectedServices value: anObject
]
